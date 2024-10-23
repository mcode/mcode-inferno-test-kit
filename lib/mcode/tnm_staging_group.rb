require_relative './codes'

module MCODE

  class TNMStagingGroup < Inferno::TestGroup
    title 'TNM Staging Tests'
    description 'Verify any Observations for a patient that are TNM stagings'
    id :tnm_staging_group

    input :patient_id,
          title: 'Patient ID'

    test do
      title 'Patient has TNM staging information'
      description %(
        Find TNM staging information
      )

      run do
        [ TNM_T_CODES, TNM_N_CODES, TNM_M_CODES ].each do |codes|
          total = 0
          codes.each do |code|
            fhir_search(:observation, params: { patient: patient_id, code: "#{SYSTEM_SNOMED}|#{code}" })
            assert_response_status 200
            assert_resource_type :bundle
            total += resource.total || 0
            assert_valid_bundle_entries resource_types: 'Observation'
          end
          assert total > 0, "No resources found with any of the following codes: #{codes.join(' ')}"
        end
      end
    end
  end
end
  