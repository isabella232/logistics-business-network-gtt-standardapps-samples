class ZCL_GTT_MIA_TP_FACTORY_DLH definition
  public
  inheriting from ZCL_GTT_TP_FACTORY
  create public .

public section.

  methods ZIF_GTT_TP_FACTORY~GET_PE_FILLER
    redefinition .
  methods ZIF_GTT_TP_FACTORY~GET_TP_READER
    redefinition .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GTT_MIA_TP_FACTORY_DLH IMPLEMENTATION.


  METHOD zif_gtt_tp_factory~get_pe_filler.

    ro_pe_filler = NEW zcl_gtt_mia_pe_filler_dlh(
      io_ef_parameters = io_ef_parameters
      io_bo_reader     = io_bo_reader ).

  ENDMETHOD.


  METHOD ZIF_GTT_TP_FACTORY~GET_TP_READER.

    ro_bo_reader = NEW zcl_gtt_mia_tp_reader_dlh(
      io_ef_parameters = io_ef_parameters ).

  ENDMETHOD.
ENDCLASS.
