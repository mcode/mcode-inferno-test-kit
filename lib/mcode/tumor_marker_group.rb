require_relative './codes'

module MCODE

  class TumorMarkerGroup < Inferno::TestGroup
    title 'Tumor Marker Tests'
    description 'Verify Observations for a patient belong to specific tumor markers'
    id :tumor_marker_group

    input :patient_id,
          title: 'Patient ID'

    # Some Ruby magic:
    {
      "ER test": TUMOR_TEST_ER_CODES,
      "PR test": TUMOR_TEST_PR_CODES,
      "HER2 test": TUMOR_TEST_HER2_CODES 
    }.each do |name,codes|
      test do
        title "Patient has #{name} observations"
        description "Check to ensure the patient has an Observation for #{name}"

        run do
          total = 0
          codes.each do |code|
            fhir_search(:observation, params: { patient: patient_id, code: "#{SYSTEM_LOINC}|#{code}" })
            assert_response_status 200
            assert_resource_type :bundle
            total += resource.total || 0
            assert_valid_bundle_entries resource_types: 'Observation'
          end
          assert total > 0, "No resources found with any of the following #{name} codes: #{codes.join(' ')}"
        end
      end
    end
  end
end
  