module MCODE
    class PrimaryCancerConditionGroup < Inferno::TestGroup
      title 'Primary Cancer Condition Tests'
      description 'Verify that patients have a condition within the MCode primary cancer condition value set'
      id :primary_cancer_condition_group
  
      test do
        title 'Patient has a Condition that is a primary cancer condition'
        description %(
          Verify that a Condition resource can be found that is a primary cancer condition.
        )
  
        input :patient_id,
              title: 'Patient ID'
  
        run do
          fhir_search(:condition, params: { patient: patient_id })
          # This should verify that the bundle entries are valid MCode
          assert_valid_bundle_entries(resource_types: ['Condition'])
          # TODO: Check to make sure that at least one of the condtions was a
          # primary cancer condition
          # resource.entry.map { |e| e.resource }.each do |resource|
          #   resource.code&.coding&.each do |coding|
          #   end
          # end
        end
      end
    end
  end
  