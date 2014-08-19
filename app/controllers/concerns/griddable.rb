module Griddable
  extend ActiveSupport::Concern

  included do
    self.class_attribute :title
    helper_method :title

    def index
      @grid = self.class.to_s.sub(/::/,'').sub(/Controller/,'Grid').constantize.new(params[self.class.to_s.sub(/::/,'').sub(/Controller/,'Grid').underscore.to_sym])
      super
    end

    protected

    def collection
      get_collection_ivar || begin
        @grid.scope {end_of_association_chain}
        set_collection_ivar @grid.assets.page(params[:page]).per(10)
      end
    end

    private

    def title
      self.class.title
    end
  end

  module ClassMethods

    def index_title(title)
      self.title = title
    end

    private

    def grid_class
      @grid_class ||= self.to_s.sub(/::/,'').sub(/Controller/,'Grid')
    end
  end
end
