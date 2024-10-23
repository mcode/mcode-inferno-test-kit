require_relative './codes'

module MCODE
  class CancerDiseaseStatusGroup < Inferno::TestGroup
    title 'Cancer Disease Status Tests'
    description 'Verify that a patient has an Observation resources that is a valid cancer disease status'
    id :cancer_disease_status_group

    input :patient_id,
          title: 'Patient ID'

    test do
      title 'Patient has a Cancer Disease Status observation'
      description %(
        Find a cancer disease status
      )

      run do
        fhir_search(:observation, params: { patient: patient_id, code: "#{SYSTEM_LOINC}|97509-4" })
        assert_response_status 200
        assert_resource_type :bundle
        assert resource.total > 0, 'No results found searching for a cancer disease status observation'
        assert_valid_bundle_entries resource_types: 'Observation'
      end
    end

  end
end
