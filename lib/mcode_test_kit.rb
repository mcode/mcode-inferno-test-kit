require_relative 'mcode/patient_group'
require_relative 'mcode/primary_cancer_condition_group'
require_relative 'mcode/cancer_disease_status_group'
require_relative 'mcode/tnm_staging_group'
require_relative 'mcode/tumor_marker_group'

module MCODE
  class Suite < Inferno::TestSuite
    id :mcode_test_suite
    title 'MCode Test Suite'
    description 'MCode test suite.'

    # These inputs will be available to all tests in this suite
    input :url,
          title: 'FHIR Server Base Url'

    input :credentials,
          title: 'OAuth Credentials',
          type: :oauth_credentials,
          optional: true

    # All FHIR requests in this suite will use this FHIR client
    fhir_client do
      url :url
      oauth_credentials :credentials
    end

    # All FHIR validation requsets will use this FHIR validator
    fhir_resource_validator do
      igs 'hl7.fhir.us.mcode#3.0.0' # Use this method for published IGs/versions
      # igs 'igs/filename.tgz'   # Use this otherwise

      exclude_message do |message|
        message.message.match?(/\A\S+: \S+: URL value '.*' does not resolve/)
      end
    end

    # Tests and TestGroups can be defined inline
    group do
      id :capability_statement
      title 'Capability Statement'
      description 'Verify that the server has a CapabilityStatement'

      test do
        id :capability_statement_read
        title 'Read CapabilityStatement'
        description 'Read CapabilityStatement from /metadata endpoint'

        run do
          fhir_get_capability_statement

          assert_response_status(200)
          assert_resource_type(:capability_statement)
        end
      end
    end

    # Tests and TestGroups can be written in separate files and then included
    # using their id
    group from: :patient_group
    group from: :primary_cancer_condition_group
    group from: :cancer_disease_status_group
    group from: :tnm_staging_group
    group from: :tumor_marker_group
  end
end
