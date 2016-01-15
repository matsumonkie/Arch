module FormState

  def self.included(base)
    base.class_eval do
      public_class_method :new
      extend  ClassMethods
      include InstanceMethods
    end
  end

  module ClassMethods
    def unit(value)
      new(value)
    end
  end

  module InstanceMethods
    def initialize(value)
      @value = join(value)
    end
  end
end

def Error(attr, error)
  { attr => error }
end

module Coercion
  extend ActiveSupport::Concern

  included do
    cattr_accessor :constraints, :errors
    self.constraints = []

    def run_errors
      self.errors ||= self.constraints.map do |method|
        self.send(method)
      end.compact
    end

    def valid?
      errors = run_errors
      errors.empty?
    end
  end

  class_methods do
    def coerce *arg
      arg.each do |constraint|
        self.constraints << constraint
      end
    end
  end
end

class Form < Either

  include FormState
  include Coercion

  attr_reader :model

  def initialize(model)
    @model = model
  end
end

def Form(form_class, model, raw_params = {})
  params = ActionController::Parameters.new(raw_params)
  attributes =
    params.require(form_class::MODEL)
          .permit(*form_class::WHITELIST)

  dup = model.dup
  dup.attributes = attributes

  form = form_class.new(dup)
  if form.valid?
    Success.new(form)
  else
    Failure.new(form)
  end
end
