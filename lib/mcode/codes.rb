module MCODE
  SYSTEM_LOINC = 'http://loinc.org'
  SYSTEM_SNOMED = 'http://snomed.info/sct'

  SYSTEM_MCODE_BASE = 'http://hl7.org/fhir/us/mcode/'

  TNM_T_CODES = %w(78873005 399504009 384625004)
  TNM_N_CODES = %w(277206009 399534004 371494008)
  TNM_M_CODES = %w(277208005 399387003 371497001)

  # The following are LOINC codes for various tumor tests
  # The tumor test group looks for observations with these codes
  # These come from
  # https://www.cms.gov/priorities/innovation/media/document/eom-clinical-data-elements-guide
  # LOINC codes for Estrogen Receptor (ER) test Observations
  TUMOR_TEST_ER_CODES = %w(16112-5 14130-9 40556-3 85337-4 85310-1 14228-1
                           85329-1)
  # LOINC codes for Progesterone Receptor (PR) test Observations
  TUMOR_TEST_PR_CODES = %w(10861-3 31207-4 40557-1 85339-0 85331-7 14230-7
                           85325-9)
  # LOINC codes for HER2 test Observations
  TUMOR_TEST_HER2_CODES = %w(32996-1 48676-1 72382-5 51981-9 72383-3 42914-2
                             18474-7 85319-2 85328-3 74885-5 74860-8 49683-6
                             96893-3 31150-6 85318-4 42783-1)

  # These are the possible valid results of a tumor test. They are the codes
  # for positive, negative, equivocal, indeterminate, and not tested, in that order.
  # (Note: the EOM CDM says equivocal is only valid for HER2 tests)
  TUMOR_TEST_RESULT_CODES = %w(LA6576-8 LA6577-6 LA11885-3 LA11884-6 LA13538-6)
end