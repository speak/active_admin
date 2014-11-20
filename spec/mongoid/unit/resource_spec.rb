require 'rails_helper'
require File.expand_path('config_shared_examples', File.dirname(__FILE__))

module ActiveAdmin
  describe Resource do

    it_should_behave_like "ActiveAdmin::Resource"
    before { load_defaults! }

    let(:application){ ActiveAdmin::Application.new }
    let(:namespace){ Namespace.new(application, :admin) }

    def config(options = {})
      @config ||= Resource.new(namespace, Category, options)
    end

    it { respond_to :resource_class }

    describe "#resource_table_name" do
      it "should return the resource's table name" do
        expect(config.resource_table_name).to eq '"categories"'
      end
      context "when the :as option is given" do
        it "should return the resource's table name" do
          expect(config(as: "My Category").resource_table_name).to eq '"categories"'
        end
      end
    end

  end
end
