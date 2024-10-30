module MCODE
  class PrimaryCancerConditionGroup < Inferno::TestGroup
    title 'Primary Cancer Condition Tests'
    description 'Verify Condition resources are valid MCode primary cancer conditions'
    id :primary_cancer_condition_group

    input :primary_cancer_condition_id,
      title: 'Primary Cancer Condition FHIR ID',
      description: 'The ID of the primary cancer condition resource being checked'

    test do
      title 'Condition is a valid MCode primary cancer condition'
      description %(
        Verify that a Condition resource matches the MCode IG for a primary cancer condition
      )

      run do
        fhir_read(:condition, primary_cancer_condition_id)
        assert_response_status 200
        # Check to make sure this is a primary cancer condition
        assert resource.meta&.profile&.include?(
            'http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-primary-cancer-condition'
          ),
          'Condition does not include the primary cancer condition MCode profile'
        assert_valid_resource
      end
    end

  end
end
  