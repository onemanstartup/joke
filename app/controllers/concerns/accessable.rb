module Accessable
  module ::InheritedResources::BaseHelpers
    def end_of_association_chain
      chain = association_chain.last
      if association_chain.is_a?(ActiveRecord::Relation)
        apply_scopes_if_available(association_chain)
      elsif chain
        if method_for_association_chain
          apply_scopes_if_available(chain.send(method_for_association_chain))
        else
          association_chain.last
        end
      else
        apply_scopes_if_available(resource_class)
      end
    end
  end

  def self.included(base)
    base.send :include, Pundit
    base.class_eval do
      before_filter :authorize_resource

      def policy_scope(scope)
        @_policy_scoped = true
        @policy_scope or Pundit.policy_scope!(current_user, scope, self.class.parent)
      end

      def policy(record)
        Pundit.policy!(current_user, record, self.class.parent)
      end

      def build_resource_params
        [params.fetch(resource_instance_name, {}).permit(*policy(permittable_resource).permitted_attributes)]
      end
    end
  end

  protected

  def permittable_resource
    case action_name.to_sym
    when *build_resources_authorized
      controlled_access_build_resource
    when *resources_authorized
      controlled_access_resource
    when *collection_authorized
      resource_class
    else
      resource_class
    end
  end

  # Authorize resource, see Policies.
  def authorize_resource
    case action_name.to_sym
    when *build_resources_authorized
      authorize(controlled_access_build_resource)
    when *resources_authorized
      authorize(controlled_access_resource)
    when *collection_authorized
      @association_chain = policy_scope(end_of_association_chain)
      authorize(resource_class)
      # # hack, reset cause nested associations, check security
      # @association_chain = nil
    else
      authorize(resource_class)
    end
  end

  private

  def controlled_access_collection(c)
    policy_scope(c)
  end

  def collection_authorized
    [:index] + Array(resources_configuration[:self].fetch(:custom_actions, {}).fetch(:collection, nil))
  end

  def build_resources_authorized
    [:new, :create]
  end

  def resources_authorized
    [:edit, :update, :show, :destroy] + Array(resources_configuration[:self].fetch(:custom_actions, {}).fetch(:resource, nil))
  end

  def controlled_access_build_resource
    return build_resource if respond_to?(:build_resource)
    resource_class.new(params[resource_class.to_s.to_sym])
  end

  def controlled_access_resource
    return resource if respond_to?(:resource)
    resource_class.find(params[:id])
  end
end
