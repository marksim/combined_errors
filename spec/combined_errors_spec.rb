require 'rspec'
require './lib/combined_errors'

class TestModel
  extend CombinedErrors::Model
  attr_accessor :property1, :property2
  attr_reader :errors
  def initialize
    @errors = { :property1 => ["is required"],
                :property2 => ["is hard", "is empty"] }
    def @errors.add(key, value)
      self[key] ||= []
      self[key] << value
    end
  end
end

describe CombinedErrors::Model do
  context "combine_errors" do
    class TestModel
      combine_errors :two_properties, :property1, :property2
    end
    let(:model) { TestModel.new }
    it "defines a new method on the model" do
      model.should respond_to :two_properties
    end

    it "gets the errors from property1 and property2" do
      model.two_properties
      model.errors[:two_properties].should == [
        "Property1 is required", "Property2 is hard", "Property2 is empty"
      ]
    end
  end
end
