module Mongoid::Document
  # useful to serialize models for active job
  include GlobalID::Identification
end
