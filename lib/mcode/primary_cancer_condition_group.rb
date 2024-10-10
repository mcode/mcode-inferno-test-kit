module MCODE
    class PrimaryCancerConditionGroup < Inferno::TestGroup
      title 'Primary Cancer Condition Tests'
      description 'Verify that patients have a condition within the MCode primary cancer condition value set'
      id :primary_cancer_condition_group

      input :patient_id,
            title: 'Patient ID'
      
  
      test do
        title 'Patient has a Condition that is the given primary cancer condition'
        description %(
          Verify that a Condition resource can be found that has the specified code
        )

        input :primary_cancer_condition_system,
          title: 'Primary Cancer Condition System',
          description: 'The coding system used by the primary cancer condition.',
          default: 'http://snomed.info/sct'
        input :primary_cancer_condition_code,
          title: 'Primary Cancer Condition Code',
          description: 'Code within the coding system to look for as the primary cancer condition'
  
        run do
          fhir_search(:condition, params: { patient: patient_id })
          resources = resource.entry.map { |e| e.resource }
          has_code = resources.any? do |resource|
            resource.code&.coding&.any? { |coding| coding.system == primary_cancer_condition_system && coding.code == primary_cancer_condition_code }
          end
          assert has_code, 'contains the specified code'
        end
      end

      test do
        title 'Conditions validate against the MCode IG'
        description 'Validates that Conditions loaded are validated'

        input :patient_id,
          title: 'Patient ID'
        run do
          fhir_search(:condition, params: { patient: patient_id })
          assert_valid_bundle_entries(resource_types: ['Condition'])
        end
      end
    end
  end
  