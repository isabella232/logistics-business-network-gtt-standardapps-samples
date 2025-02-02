class ZCL_GTT_STS_BO_TRK_ONCU_FB definition
  public
  inheriting from ZCL_GTT_STS_BO_TOR_READER
  create public .

public section.

  methods ZIF_GTT_STS_BO_READER~GET_DATA
    redefinition .
  methods ZIF_GTT_STS_BO_READER~GET_TRACK_ID_DATA
    redefinition .
protected section.

  methods GET_DOCREF_DATA
    redefinition .
  methods GET_REQUIREMENT_DOC_LIST
    redefinition .
private section.

  types:
    BEGIN OF ts_freight_booking,
      shipment_type         TYPE string,
      tor_id                TYPE /scmtms/s_em_bo_tor_root-tor_id,
      mtr                   TYPE /scmtms/s_em_bo_tor_root-mtr,
      dgo_indicator         TYPE /scmtms/s_em_bo_tor_root-dgo_indicator,
      tspid                 TYPE bu_id_number,
      total_distance_km     TYPE /scmtms/total_distance_km,
      total_distance_km_uom TYPE meins,
      total_duration_net    TYPE /scmtms/total_duration_net,
      pln_grs_duration      TYPE /scmtms/total_duration_net,
      shipping_type         TYPE /scmtms/s_em_bo_tor_root-shipping_type,
      traffic_direct        TYPE /scmtms/s_em_bo_tor_root-traffic_direct,
      tracked_object_type   TYPE tt_tracked_object_type,
      tracked_object_id     TYPE tt_tracked_object_id,
      inc_class_code        TYPE /scmtms/s_em_bo_tor_item-inc_class_code,
      inc_transf_loc_n      TYPE /scmtms/s_em_bo_tor_item-inc_transf_loc_n,
      gro_vol_val           TYPE /scmtms/s_em_bo_tor_root-gro_vol_val,
      gro_vol_uni           TYPE /scmtms/s_em_bo_tor_root-gro_vol_uni,
      gro_wei_val           TYPE /scmtms/s_em_bo_tor_root-gro_wei_val,
      gro_wei_uni           TYPE /scmtms/s_em_bo_tor_root-gro_wei_uni,
      qua_pcs_val           TYPE /scmtms/s_em_bo_tor_root-qua_pcs_val,
      qua_pcs_uni           TYPE /scmtms/s_em_bo_tor_root-qua_pcs_uni,
      trmodcod              TYPE /scmtms/s_em_bo_tor_root-trmodcod,
      carrier_ref_value     TYPE tt_carrier_ref_value,
      carrier_ref_type      TYPE tt_carrier_ref_type,
      shipper_ref_value     TYPE tt_shipper_ref_value,
      shipper_ref_type      TYPE tt_shipper_ref_type,
      pln_arr_loc_id        TYPE /scmtms/s_em_bo_tor_stop-log_locid,
      pln_arr_loc_type      TYPE /saptrx/loc_id_type,
      pln_arr_timest        TYPE char16,
      pln_arr_timezone      TYPE timezone,
      pln_dep_loc_id        TYPE /scmtms/s_em_bo_tor_stop-log_locid,
      pln_dep_loc_type      TYPE /saptrx/loc_id_type,
      pln_dep_timest        TYPE char16,
      pln_dep_timezone      TYPE timezone,
      stop_id               TYPE tt_stop_id,
      ordinal_no            TYPE tt_ordinal_no,
      loc_type              TYPE tt_loc_type,
      loc_id                TYPE tt_loc_id,
      req_doc_line_no       TYPE tt_req_doc_line_number,
      req_doc_no            TYPE tt_req_doc_number,
      req_doc_first_stop    TYPE tt_stop,
      req_doc_last_stop     TYPE tt_stop,
      resource_tp_line_cnt  TYPE tt_resource_tp_line_cnt,
      resource_tp_id        TYPE tt_resource_tp_id,
      tu_line_no            TYPE tt_tu_line_no,
      tu_type               TYPE tt_tu_type,
      tu_value              TYPE tt_tu_value,
      tu_number             TYPE tt_tu_number,
      tu_first_stop         TYPE tt_tu_first_stop,
      tu_last_stop          TYPE tt_tu_last_stop,
    END OF ts_freight_booking .

  constants:
    BEGIN OF cs_mbl_doctype,
      ocean_fb TYPE string VALUE 'T52' ##NO_TEXT,
      air_fb   TYPE string VALUE 'T55' ##NO_TEXT,
    END OF cs_mbl_doctype .

  methods GET_DATA_FROM_MAINTAB
    importing
      !IR_MAINTAB type ref to DATA
      !IV_OLD_DATA type ABAP_BOOL default ABAP_FALSE
    changing
      !CS_FREIGHT_BOOKING type TS_FREIGHT_BOOKING
    raising
      CX_UDM_MESSAGE .
  methods GET_TRACKED_OBJECTS
    importing
      !IR_DATA type ref to DATA
      !IV_OLD_DATA type ABAP_BOOL default ABAP_FALSE
    changing
      !CS_FREIGHT_BOOKING type TS_FREIGHT_BOOKING
    raising
      CX_UDM_MESSAGE .
  methods GET_MAINTABREF
    importing
      !IS_APP_OBJECT type TRXAS_APPOBJ_CTAB_WA
    returning
      value(RR_MAINTABREF) type ref to DATA .
  methods GET_VESSEL_TRACK
    importing
      !IR_DATA type ref to DATA
      !IV_OLD_DATA type ABAP_BOOL
    changing
      !CT_TRACKED_OBJECT_TYPE type TT_TRACKED_OBJECT_TYPE
      !CT_TRACKED_OBJECT_ID type TT_TRACKED_OBJECT_ID
    raising
      CX_UDM_MESSAGE .
  methods GET_DATA_FROM_ITEM
    importing
      !IR_DATA type ref to DATA
      !IV_OLD_DATA type ABAP_BOOL default ABAP_FALSE
    changing
      !CS_FREIGHT_BOOKING type TS_FREIGHT_BOOKING
    raising
      CX_UDM_MESSAGE .
  methods GET_FLIGHT_NUMBER_TRACK
    importing
      !IR_DATA type ref to DATA
      !IV_OLD_DATA type ABAP_BOOL
    changing
      !CT_TRACKED_OBJECT_TYPE type TT_TRACKED_OBJECT_TYPE
      !CT_TRACKED_OBJECT_ID type TT_TRACKED_OBJECT_ID
    raising
      CX_UDM_MESSAGE .
  methods GET_FLIGHT_NUMBER_TRACK_ID
    importing
      !IS_APP_OBJECT type TRXAS_APPOBJ_CTAB_WA
      !IV_OLD_DATA type ABAP_BOOL default ABAP_FALSE
    changing
      !CT_TRACK_ID_DATA type ZIF_GTT_STS_EF_TYPES=>TT_ENH_TRACK_ID_DATA
    raising
      CX_UDM_MESSAGE .
  methods GET_IMO_TRACK
    importing
      !IR_DATA type ref to DATA
      !IV_OLD_DATA type ABAP_BOOL
    changing
      !CT_TRACKED_OBJECT_TYPE type TT_TRACKED_OBJECT_TYPE
      !CT_TRACKED_OBJECT_ID type TT_TRACKED_OBJECT_ID
    raising
      CX_UDM_MESSAGE .
  methods GET_TRACKING_UNIT
    importing
      !IR_DATA type ref to DATA
      !IV_OLD_DATA type ABAP_BOOL default ABAP_FALSE
    changing
      !CS_FREIGHT_BOOKING type TS_FREIGHT_BOOKING
    raising
      CX_UDM_MESSAGE .
ENDCLASS.



CLASS ZCL_GTT_STS_BO_TRK_ONCU_FB IMPLEMENTATION.


  METHOD GET_DATA_FROM_ITEM.

    FIELD-SYMBOLS:
      <lt_tor_item> TYPE /scmtms/t_em_bo_tor_item,
      <ls_tor_root> TYPE /scmtms/s_em_bo_tor_root.

    ASSIGN ir_data->* TO <ls_tor_root>.
    IF sy-subrc <> 0.
      MESSAGE e010(zgtt_sts) INTO DATA(lv_dummy) ##needed.
      zcl_gtt_sts_tools=>throw_exception( ).
    ENDIF.

    DATA(lr_item) = mo_ef_parameters->get_appl_table(
                        SWITCH #( iv_old_data WHEN abap_true THEN zif_gtt_sts_constants=>cs_tabledef-fo_item_old
                                              ELSE zif_gtt_sts_constants=>cs_tabledef-fo_item_new ) ).
    ASSIGN lr_item->* TO <lt_tor_item>.
    IF sy-subrc <> 0.
      MESSAGE e010(zgtt_sts) INTO lv_dummy.
      zcl_gtt_sts_tools=>throw_exception( ).
    ENDIF.

    ASSIGN <lt_tor_item>[ item_cat       = /scmtms/if_tor_const=>sc_tor_item_category-booking
                          parent_node_id = <ls_tor_root>-node_id ] TO FIELD-SYMBOL(<ls_booking_item>).
    IF sy-subrc <> 0.
      MESSAGE e010(zgtt_sts) INTO lv_dummy.
      zcl_gtt_sts_tools=>throw_exception( ).
    ENDIF.

    cs_freight_booking-inc_class_code   = <ls_booking_item>-inc_class_code.
    cs_freight_booking-inc_transf_loc_n = <ls_booking_item>-inc_transf_loc_n.
    cs_freight_booking-gro_vol_val      = <ls_booking_item>-gro_vol_val.
    cs_freight_booking-gro_vol_uni      = <ls_booking_item>-gro_vol_uni.
    cs_freight_booking-gro_wei_val      = <ls_booking_item>-gro_wei_val.
    cs_freight_booking-gro_wei_uni      = <ls_booking_item>-gro_wei_uni.
    IF <ls_tor_root>-trmodcod = zif_gtt_sts_constants=>cs_trmodcod-air.
      cs_freight_booking-qua_pcs_val = <ls_booking_item>-incl_piece_count.
      cs_freight_booking-qua_pcs_uni = zif_gtt_sts_constants=>cs_uom-piece.
    ELSE.
      cs_freight_booking-qua_pcs_val = <ls_booking_item>-qua_pcs_val.
      cs_freight_booking-qua_pcs_uni = <ls_booking_item>-qua_pcs_uni.
    ENDIF.

  ENDMETHOD.


  METHOD GET_DATA_FROM_MAINTAB.

    FIELD-SYMBOLS:
      <ls_root>     TYPE /scmtms/s_em_bo_tor_root,
      <lt_root_old> TYPE /scmtms/t_em_bo_tor_root.

    ASSIGN ir_maintab->* TO <ls_root>.
    IF sy-subrc <> 0.
      MESSAGE e010(zgtt_sts) INTO DATA(lv_dummy) ##needed.
      zcl_gtt_sts_tools=>throw_exception( ).
    ENDIF.

    IF iv_old_data = abap_true.
      DATA(lr_root_old) = mo_ef_parameters->get_appl_table( zif_gtt_sts_constants=>cs_tabledef-fo_header_old ).

      ASSIGN lr_root_old->* TO <lt_root_old>.
      IF sy-subrc = 0.
        ASSIGN <lt_root_old>[ tor_id = <ls_root>-tor_id ] TO <ls_root>.
        IF sy-subrc <> 0.
          " Record was just created
          RETURN.
        ENDIF.
      ENDIF.
      DATA(lv_before_image) = abap_true.
    ENDIF.

    cs_freight_booking-shipment_type = zif_gtt_sts_constants=>cs_shipment_type-tor.
    cs_freight_booking-tor_id = <ls_root>-tor_id.
    cs_freight_booking-tspid  = <ls_root>-tspid.
    SHIFT cs_freight_booking-tor_id LEFT DELETING LEADING '0'.
    cs_freight_booking-dgo_indicator = <ls_root>-dgo_indicator.
    cs_freight_booking-tspid = get_carrier_name( iv_tspid = cs_freight_booking-tspid ).

    TEST-SEAM lv_mtr.
      SELECT SINGLE motscode
        FROM /sapapo/trtype
        INTO cs_freight_booking-mtr
        WHERE ttype = <ls_root>-mtr.
      SHIFT cs_freight_booking-mtr LEFT DELETING LEADING '0'.
    END-TEST-SEAM.


    TEST-SEAM lt_tor_add_info.
      /scmtms/cl_tor_helper_root=>det_transient_root_fields(
        EXPORTING
          it_key               = VALUE #( ( key = <ls_root>-node_id ) )
          iv_get_stop_infos    = abap_true
          iv_get_mainitem_info = abap_true
          iv_before_image      = lv_before_image
        IMPORTING
          et_tor_add_info      = DATA(lt_tor_add_info) ).
    END-TEST-SEAM.
    ASSIGN lt_tor_add_info[ 1 ] TO FIELD-SYMBOL(<ls_tor_additional_info>).
    IF sy-subrc = 0.
      cs_freight_booking-pln_grs_duration = <ls_tor_additional_info>-tot_duration.
    ENDIF.

    cs_freight_booking-total_duration_net    = <ls_root>-total_duration_net.
    cs_freight_booking-total_distance_km     = <ls_root>-total_distance_km.
    IF cs_freight_booking-total_distance_km IS NOT INITIAL.
      cs_freight_booking-total_distance_km_uom = zif_gtt_sts_constants=>cs_uom-km.
    ENDIF.
    cs_freight_booking-traffic_direct        = <ls_root>-traffic_direct.
    cs_freight_booking-shipping_type         = <ls_root>-shipping_type.
    cs_freight_booking-trmodcod              = zcl_gtt_sts_tools=>get_trmodcod( iv_trmodcod = <ls_root>-trmodcod ).

  ENDMETHOD.


  METHOD GET_DOCREF_DATA.

    DATA lv_master_bill_of_landing TYPE string.

    FIELD-SYMBOLS:
      <ls_root>     TYPE /scmtms/s_em_bo_tor_root,
      <lt_root_old> TYPE /scmtms/t_em_bo_tor_root.

    TEST-SEAM lt_ref_values.
      super->get_docref_data(
        EXPORTING
          ir_root         = ir_root
          iv_old_data     = iv_old_data
        CHANGING
          ct_carrier_ref_value = ct_carrier_ref_value
          ct_carrier_ref_type  = ct_carrier_ref_type
          ct_shipper_ref_value = ct_shipper_ref_value
          ct_shipper_ref_type  = ct_shipper_ref_type ).
    END-TEST-SEAM.

    ASSIGN ir_root->* TO <ls_root>.
    IF sy-subrc <> 0.
      MESSAGE e010(zgtt_sts) INTO DATA(lv_dummy) ##needed.
      zcl_gtt_sts_tools=>throw_exception( ).
    ENDIF.

    IF iv_old_data = abap_true.
      DATA(lr_root_old) = mo_ef_parameters->get_appl_table( zif_gtt_sts_constants=>cs_tabledef-fo_header_old ).
      ASSIGN lr_root_old->* TO <lt_root_old>.
      IF sy-subrc = 0.
        ASSIGN <lt_root_old>[ tor_id = <ls_root>-tor_id ] TO <ls_root>.
        IF sy-subrc <> 0.
          MESSAGE e010(zgtt_sts) INTO lv_dummy.
          zcl_gtt_sts_tools=>throw_exception( ).
        ENDIF.
      ENDIF.
    ENDIF.

    IF <ls_root>-trmodcod = zif_gtt_sts_constants=>cs_trmodcod-air.
      IF <ls_root>-tsp_airlcawb IS NOT INITIAL AND <ls_root>-partner_mbl_id IS INITIAL.
        lv_master_bill_of_landing = <ls_root>-tsp_airlcawb.
      ELSEIF <ls_root>-tsp_airlcawb IS INITIAL AND <ls_root>-partner_mbl_id IS NOT INITIAL.
        lv_master_bill_of_landing = <ls_root>-partner_mbl_id.
      ELSEIF <ls_root>-tsp_airlcawb IS NOT INITIAL AND <ls_root>-partner_mbl_id IS NOT INITIAL.
        lv_master_bill_of_landing = |{ <ls_root>-tsp_airlcawb }-{ <ls_root>-partner_mbl_id }|.
      ENDIF.
      IF lv_master_bill_of_landing IS NOT INITIAL.
        APPEND lv_master_bill_of_landing TO ct_carrier_ref_value.
        APPEND cs_mbl_doctype-air_fb     TO ct_carrier_ref_type.
      ENDIF.
    ELSE.
      IF <ls_root>-partner_mbl_id IS NOT INITIAL.
        APPEND <ls_root>-partner_mbl_id TO ct_carrier_ref_value.
        APPEND cs_mbl_doctype-ocean_fb  TO ct_carrier_ref_type.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD GET_FLIGHT_NUMBER_TRACK.
    FIELD-SYMBOLS:
      <lt_tor_item> TYPE /scmtms/t_em_bo_tor_item,
      <ls_tor_root> TYPE /scmtms/s_em_bo_tor_root.

    ASSIGN ir_data->* TO <ls_tor_root>.
    IF sy-subrc = 0.
      DATA(lr_item) = mo_ef_parameters->get_appl_table(
                        SWITCH #( iv_old_data WHEN abap_false THEN zif_gtt_sts_constants=>cs_tabledef-fo_item_new
                                              ELSE zif_gtt_sts_constants=>cs_tabledef-fo_item_old ) ).
      ASSIGN lr_item->* TO <lt_tor_item>.
      IF sy-subrc = 0.
        ASSIGN <lt_tor_item>[ item_cat       = /scmtms/if_tor_const=>sc_tor_item_category-booking
                              parent_node_id = <ls_tor_root>-node_id ] TO FIELD-SYMBOL(<ls_tor_item>).
        IF sy-subrc = 0
          AND <ls_tor_item>-mtr = zif_gtt_sts_constants=>cs_mtr-air
          AND <ls_tor_item>-flight_code   IS NOT INITIAL
          AND <ls_tor_item>-flight_number IS NOT INITIAL.
          APPEND cs_track_id-flight_number TO ct_tracked_object_id.
          APPEND <ls_tor_item>-flight_code TO ct_tracked_object_type.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD GET_FLIGHT_NUMBER_TRACK_ID.

    FIELD-SYMBOLS:
      <lt_tor_item> TYPE /scmtms/t_em_bo_tor_item,
      <ls_tor_root> TYPE /scmtms/s_em_bo_tor_root.

    DATA:
      lv_tmp_restrxcod TYPE /saptrx/trxcod,
      lv_restrxcod     TYPE /saptrx/trxcod.

    lv_restrxcod = zif_gtt_sts_constants=>cs_trxcod-fo_resource.

    ASSIGN is_app_object-maintabref->* TO <ls_tor_root>.
    IF sy-subrc = 0.
      DATA(lv_tabledef_tor_item) = SWITCH #( iv_old_data
                                     WHEN abap_false THEN zif_gtt_sts_constants=>cs_tabledef-fo_item_new
                                     ELSE zif_gtt_sts_constants=>cs_tabledef-fo_item_old ).

      DATA(lr_item) = mo_ef_parameters->get_appl_table( iv_tabledef = lv_tabledef_tor_item ).
      ASSIGN lr_item->* TO <lt_tor_item>.
      IF sy-subrc = 0.
        ASSIGN <lt_tor_item>[ item_cat       = /scmtms/if_tor_const=>sc_tor_item_category-booking
                              parent_node_id = <ls_tor_root>-node_id ] TO FIELD-SYMBOL(<ls_tor_item>).
        IF sy-subrc = 0
          AND <ls_tor_item>-mtr = zif_gtt_sts_constants=>cs_mtr-air
          AND <ls_tor_item>-flight_code   IS NOT INITIAL
          AND <ls_tor_item>-flight_number IS NOT INITIAL.

          DATA(lv_tor_id) = |{ <ls_tor_root>-tor_id ALPHA = OUT }|.
          CONDENSE lv_tor_id.

          APPEND VALUE #(
                    appsys      = mo_ef_parameters->get_appsys( )
                    appobjtype  = is_app_object-appobjtype
                    appobjid    = is_app_object-appobjid
                    trxcod      = lv_restrxcod
                    trxid       =  |{ lv_tor_id }{ <ls_tor_item>-flight_code }| ) TO ct_track_id_data.
        ENDIF.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD GET_IMO_TRACK.

    FIELD-SYMBOLS:
      <lt_tor_item> TYPE /scmtms/t_em_bo_tor_item,
      <ls_tor_root> TYPE /scmtms/s_em_bo_tor_root.

    ASSIGN ir_data->* TO <ls_tor_root>.
    IF sy-subrc = 0.
      DATA(lr_item) = mo_ef_parameters->get_appl_table(
                        SWITCH #( iv_old_data WHEN abap_false THEN zif_gtt_sts_constants=>cs_tabledef-fo_item_new
                                              ELSE zif_gtt_sts_constants=>cs_tabledef-fo_item_old ) ).
      ASSIGN lr_item->* TO <lt_tor_item>.
      IF sy-subrc = 0.
        ASSIGN <lt_tor_item>[ item_cat       = /scmtms/if_tor_const=>sc_tor_item_category-booking
                              parent_node_id = <ls_tor_root>-node_id ]-imo_id TO FIELD-SYMBOL(<lv_imo_id>).
        IF sy-subrc = 0.
          IF <lv_imo_id> IS NOT INITIAL AND <lv_imo_id> <> 'IMO'.
            APPEND cs_track_id-imo TO ct_tracked_object_id.
            APPEND <lv_imo_id>     TO ct_tracked_object_type.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD GET_MAINTABREF.

    FIELD-SYMBOLS <lt_maintabref> TYPE ANY TABLE.

    ASSIGN is_app_object-maintabref->* TO FIELD-SYMBOL(<ls_maintabref>).

    IF <ls_maintabref> IS ASSIGNED AND zcl_gtt_sts_tools=>is_table( iv_value = <ls_maintabref> ) = abap_true.
      ASSIGN <ls_maintabref> TO <lt_maintabref>.
      LOOP AT <lt_maintabref> ASSIGNING FIELD-SYMBOL(<ls_line>).
        ASSIGN COMPONENT /scmtms/if_tor_c=>sc_node_attribute-root-tor_cat
          OF STRUCTURE <ls_line> TO FIELD-SYMBOL(<lv_tor_cat>).
        IF sy-subrc = 0 AND <lv_tor_cat> = /scmtms/if_tor_const=>sc_tor_category-booking.
          GET REFERENCE OF <ls_line> INTO rr_maintabref.
          EXIT.
        ENDIF.
      ENDLOOP.
    ELSEIF <ls_maintabref> IS ASSIGNED.
      GET REFERENCE OF <ls_maintabref> INTO rr_maintabref.
    ENDIF.

  ENDMETHOD.


  METHOD GET_TRACKED_OBJECTS.

    get_container_and_mobile_track(
      EXPORTING
        ir_data                = ir_data
        iv_old_data            = iv_old_data
      CHANGING
        ct_tracked_object_type = cs_freight_booking-tracked_object_type
        ct_tracked_object_id   = cs_freight_booking-tracked_object_id ).

    get_vessel_track(
      EXPORTING
        ir_data                = ir_data
        iv_old_data            = iv_old_data
      CHANGING
        ct_tracked_object_type = cs_freight_booking-tracked_object_type
        ct_tracked_object_id   = cs_freight_booking-tracked_object_id ).

    get_imo_track(
      EXPORTING
        ir_data                = ir_data
        iv_old_data            = iv_old_data
      CHANGING
        ct_tracked_object_type = cs_freight_booking-tracked_object_type
        ct_tracked_object_id   = cs_freight_booking-tracked_object_id ).

    get_flight_number_track(
      EXPORTING
        ir_data                = ir_data
        iv_old_data            = iv_old_data
      CHANGING
        ct_tracked_object_type = cs_freight_booking-tracked_object_type
        ct_tracked_object_id   = cs_freight_booking-tracked_object_id ).

  ENDMETHOD.


  METHOD get_tracking_unit.

    FIELD-SYMBOLS:
      <lt_tor_root_req>    TYPE /scmtms/t_em_bo_tor_root.

    DATA:
      ls_container     TYPE ts_container,
      lt_container     TYPE tt_container,
      lt_tmp_container TYPE tt_container,
      lt_stop_info     TYPE tt_stop_info,
      lv_tor_id        TYPE /scmtms/tor_id,
      lt_req_tor       TYPE /scmtms/t_em_bo_tor_root,
      lv_prefix        TYPE char20,
      lv_suffix        TYPE char4,
      lv_length        TYPE i,
      lv_line_no       TYPE int4,
      lv_tmp_value     TYPE char255,
      lt_tmp_cont      TYPE TABLE OF /scmtms/package_id.

    zcl_gtt_sts_tools=>get_req_stop_info(
      EXPORTING
        ir_root     = ir_data
        iv_old_data = iv_old_data
      IMPORTING
        et_req_stop = DATA(lt_req_stop) ).

    zcl_gtt_sts_tools=>get_req_info(
      EXPORTING
        ir_root     = ir_data
        iv_old_data = iv_old_data
      IMPORTING
        et_req_tor  = lt_req_tor ).

    LOOP AT lt_req_tor ASSIGNING FIELD-SYMBOL(<ls_tor_root_req>).

      lv_tor_id = <ls_tor_root_req>-tor_id.
      SHIFT lv_tor_id LEFT DELETING LEADING '0'.

      zcl_gtt_sts_tools=>get_container_num_on_cu(
        EXPORTING
          ir_root      = REF #( <ls_tor_root_req> )
          iv_old_data  = iv_old_data
        IMPORTING
          et_container = lt_tmp_cont ).

      LOOP AT lt_tmp_cont INTO DATA(ls_tmp_cont).
        ls_container-object_id = cs_track_id-container_id.
        ls_container-object_value = ls_tmp_cont.
        APPEND ls_container TO lt_container.
        CLEAR ls_container.
      ENDLOOP.

      LOOP AT lt_container INTO ls_container.
        lv_line_no = lv_line_no + 1.
        APPEND lv_line_no TO cs_freight_booking-tu_line_no.
        APPEND ls_container-object_id TO cs_freight_booking-tu_type.
        APPEND ls_container-object_value TO cs_freight_booking-tu_value.

        CLEAR lv_tmp_value.
        lv_tmp_value = |{ lv_tor_id }{ ls_container-object_value }|.
        CONDENSE lv_tmp_value NO-GAPS.
        APPEND lv_tmp_value TO cs_freight_booking-tu_number.

        READ TABLE lt_req_stop INTO DATA(ls_req_stop) WITH KEY tor_id = lv_tor_id.
        IF sy-subrc = 0.
          lv_length = strlen( ls_req_stop-first_stop ) - 4.
          lv_prefix = ls_req_stop-first_stop+0(lv_length).
          lv_suffix = ls_req_stop-first_stop+lv_length(*).

          CLEAR lv_tmp_value.
          lv_tmp_value = |{ lv_prefix }{ ls_container-object_value }{ lv_suffix }|.
          CONDENSE lv_tmp_value NO-GAPS.
          APPEND lv_tmp_value TO cs_freight_booking-tu_first_stop.

          lv_length = strlen( ls_req_stop-last_stop ) - 4.
          lv_prefix = ls_req_stop-last_stop+0(lv_length).
          lv_suffix = ls_req_stop-last_stop+lv_length(*).

          CLEAR lv_tmp_value.
          lv_tmp_value = |{ lv_prefix }{ ls_container-object_value }{ lv_suffix }|.
          CONDENSE lv_tmp_value NO-GAPS.
          APPEND lv_tmp_value TO cs_freight_booking-tu_last_stop.

        ENDIF.

        CLEAR:
          lv_length,
          lv_prefix,
          lv_suffix,
          lv_tmp_value.
      ENDLOOP.

      CLEAR:
        lt_tmp_cont,
        lt_container.
    ENDLOOP.

  ENDMETHOD.


  METHOD GET_VESSEL_TRACK.

    FIELD-SYMBOLS:
      <lt_tor_item> TYPE /scmtms/t_em_bo_tor_item,
      <ls_tor_root> TYPE /scmtms/s_em_bo_tor_root.

    ASSIGN ir_data->* TO <ls_tor_root>.
    IF sy-subrc = 0.
      DATA(lr_item) = mo_ef_parameters->get_appl_table(
                        SWITCH #( iv_old_data WHEN abap_false THEN zif_gtt_sts_constants=>cs_tabledef-fo_item_new
                                              ELSE zif_gtt_sts_constants=>cs_tabledef-fo_item_old ) ).
      ASSIGN lr_item->* TO <lt_tor_item>.
      IF sy-subrc = 0.
        ASSIGN <lt_tor_item>[ item_cat       = /scmtms/if_tor_const=>sc_tor_item_category-booking
                              parent_node_id = <ls_tor_root>-node_id ]-vessel_id TO FIELD-SYMBOL(<lv_vessel_id>).
        IF sy-subrc = 0.
          IF <lv_vessel_id> IS NOT INITIAL.
            APPEND cs_track_id-vessel TO ct_tracked_object_id.
            APPEND <lv_vessel_id>     TO ct_tracked_object_type.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD zif_gtt_sts_bo_reader~get_data.

    FIELD-SYMBOLS <ls_freight_booking> TYPE ts_freight_booking.

    rr_data = NEW ts_freight_booking( ).
    ASSIGN rr_data->* TO <ls_freight_booking>.
    IF sy-subrc <> 0.
      MESSAGE e010(zgtt_sts) INTO DATA(lv_dummy) ##needed.
      zcl_gtt_sts_tools=>throw_exception( ).
    ENDIF.

    DATA(lr_maintabref) = get_maintabref( is_app_object ).
    get_data_from_maintab(
      EXPORTING
        iv_old_data        = iv_old_data
        ir_maintab         = lr_maintabref
      CHANGING
        cs_freight_booking = <ls_freight_booking> ).
    IF <ls_freight_booking> IS INITIAL.
      RETURN.
    ENDIF.

    get_data_from_item(
      EXPORTING
        iv_old_data        = iv_old_data
        ir_data            = lr_maintabref
      CHANGING
        cs_freight_booking = <ls_freight_booking> ).

    get_docref_data(
      EXPORTING
        iv_old_data          = iv_old_data
        ir_root              = lr_maintabref
      CHANGING
        ct_carrier_ref_value = <ls_freight_booking>-carrier_ref_value
        ct_carrier_ref_type  = <ls_freight_booking>-carrier_ref_type
        ct_shipper_ref_value = <ls_freight_booking>-shipper_ref_value
        ct_shipper_ref_type  = <ls_freight_booking>-shipper_ref_type ).

    CLEAR:
      <ls_freight_booking>-carrier_ref_value,
      <ls_freight_booking>-carrier_ref_type.

    IF <ls_freight_booking>-shipper_ref_value IS INITIAL.
      APPEND '' TO <ls_freight_booking>-shipper_ref_value.
    ENDIF.

    get_data_from_stop(
      EXPORTING
        ir_data             = lr_maintabref
        iv_old_data         = iv_old_data
      CHANGING
        cv_pln_dep_loc_id   = <ls_freight_booking>-pln_dep_loc_id
        cv_pln_dep_loc_type = <ls_freight_booking>-pln_dep_loc_type
        cv_pln_dep_timest   = <ls_freight_booking>-pln_dep_timest
        cv_pln_dep_timezone = <ls_freight_booking>-pln_dep_timezone
        cv_pln_arr_loc_id   = <ls_freight_booking>-pln_arr_loc_id
        cv_pln_arr_loc_type = <ls_freight_booking>-pln_arr_loc_type
        cv_pln_arr_timest   = <ls_freight_booking>-pln_arr_timest
        cv_pln_arr_timezone = <ls_freight_booking>-pln_arr_timezone
        ct_stop_id          = <ls_freight_booking>-stop_id
        ct_ordinal_no       = <ls_freight_booking>-ordinal_no
        ct_loc_type         = <ls_freight_booking>-loc_type
        ct_loc_id           = <ls_freight_booking>-loc_id ).

    get_requirement_doc_list(
      EXPORTING
        ir_data            = lr_maintabref
        iv_old_data        = iv_old_data
      CHANGING
        ct_req_doc_line_no = <ls_freight_booking>-req_doc_line_no
        ct_req_doc_no      = <ls_freight_booking>-req_doc_no ).
    IF <ls_freight_booking>-req_doc_no IS INITIAL.
      APPEND '' TO <ls_freight_booking>-req_doc_line_no.
    ENDIF.

*   trackingUnits
    get_tracking_unit(
      EXPORTING
        ir_data            = lr_maintabref
        iv_old_data        = iv_old_data
      CHANGING
        cs_freight_booking = <ls_freight_booking> ).

    IF <ls_freight_booking>-tu_line_no IS INITIAL.
      APPEND '' TO <ls_freight_booking>-tu_line_no.
    ENDIF.

  ENDMETHOD.


  METHOD zif_gtt_sts_bo_reader~get_track_id_data.

    "FB
    FIELD-SYMBOLS:
      <ls_root_new>         TYPE /scmtms/s_em_bo_tor_root,
      <lt_root_old>         TYPE /scmtms/t_em_bo_tor_root,
      <lt_tor_root_req_new> TYPE /scmtms/t_em_bo_tor_root,
      <lt_tor_root_req_old> TYPE /scmtms/t_em_bo_tor_root.

    DATA:
      lr_root_old          TYPE REF TO data,
      lt_track_id_data_new TYPE zif_gtt_sts_ef_types=>tt_enh_track_id_data,
      lt_track_id_data_old TYPE zif_gtt_sts_ef_types=>tt_enh_track_id_data,
      lv_fotrxcod          TYPE /saptrx/trxcod,
      lt_container         TYPE TABLE OF /scmtms/package_id,
      lt_package_id        TYPE TABLE OF /scmtms/package_id,
      lt_req_tor_new       TYPE /scmtms/t_em_bo_tor_root,
      lt_req_tor_old       TYPE /scmtms/t_em_bo_tor_root,
      lv_trxid             TYPE /saptrx/trxid,
      lv_tutrxcod          TYPE /saptrx/trxcod.

    ASSIGN is_app_object-maintabref->* TO <ls_root_new>.

    lr_root_old = mo_ef_parameters->get_appl_table( iv_tabledef = zif_gtt_sts_constants=>cs_tabledef-fo_header_old ).
    ASSIGN lr_root_old->* TO <lt_root_old>.
    IF <ls_root_new> IS NOT ASSIGNED OR <lt_root_old> IS NOT ASSIGNED.
      MESSAGE e010(zgtt_sts) INTO DATA(lv_dummy) ##needed.
      zcl_gtt_sts_tools=>throw_exception( ).
    ENDIF.

    lv_fotrxcod = zif_gtt_sts_constants=>cs_trxcod-fo_number.
    lv_tutrxcod = zif_gtt_sts_constants=>cs_trxcod-tu_number.

    add_track_id_data(
      EXPORTING
        is_app_object = is_app_object
        iv_trxcod     = lv_fotrxcod
        iv_trxid      = |{ <ls_root_new>-tor_id  ALPHA = OUT }|
      CHANGING
        ct_track_id   = et_track_id_data ).

    zcl_gtt_sts_tools=>get_req_info(
      EXPORTING
        ir_root     = REF #( <ls_root_new> )
        iv_old_data = abap_false
      IMPORTING
        et_req_tor  = lt_req_tor_new ).

    LOOP AT lt_req_tor_new ASSIGNING FIELD-SYMBOL(<ls_tor_root_req_new>)
      WHERE tor_cat = /scmtms/if_tor_const=>sc_tor_category-transp_unit.
      CLEAR:
        lt_container.

      DATA(lv_tor_id) = |{ <ls_tor_root_req_new>-tor_id  ALPHA = OUT }|.
      CONDENSE lv_tor_id.

      zcl_gtt_sts_tools=>get_container_num_on_cu(
        EXPORTING
          ir_root      = REF #( <ls_tor_root_req_new> )
          iv_old_data  = abap_false
        IMPORTING
          et_container = lt_container ).

      LOOP AT lt_container INTO DATA(ls_container).
        CLEAR lv_trxid.
        lv_trxid = |{ lv_tor_id } { ls_container }|.
        CONDENSE lv_trxid NO-GAPS.

        APPEND VALUE #( key = |{ <ls_tor_root_req_new>-tor_id ALPHA = OUT }|
                appsys      = mo_ef_parameters->get_appsys( )
                appobjtype  = is_app_object-appobjtype
                appobjid    = |{ is_app_object-appobjid ALPHA = OUT }|
                trxcod      = lv_tutrxcod
                trxid       = lv_trxid ) TO lt_track_id_data_new.

      ENDLOOP.
    ENDLOOP.

    CLEAR:
      lt_container.

    zcl_gtt_sts_tools=>get_req_info(
      EXPORTING
        ir_root     = REF #( <ls_root_new> )
        iv_old_data = abap_true
      IMPORTING
        et_req_tor  = lt_req_tor_old ).

    LOOP AT lt_req_tor_old ASSIGNING FIELD-SYMBOL(<ls_tor_root_req_old>)
      WHERE tor_cat = /scmtms/if_tor_const=>sc_tor_category-transp_unit.
      CLEAR:
        lt_container.

      lv_tor_id = |{ <ls_tor_root_req_old>-tor_id  ALPHA = OUT }|.
      CONDENSE lv_tor_id.

      zcl_gtt_sts_tools=>get_container_num_on_cu(
        EXPORTING
          ir_root      = REF #( <ls_tor_root_req_old> )
          iv_old_data  = abap_true
        IMPORTING
          et_container = lt_container ).

      LOOP AT lt_container INTO ls_container.
        CLEAR lv_trxid.
        lv_trxid = |{ lv_tor_id } { ls_container }|.
        CONDENSE lv_trxid NO-GAPS.

        APPEND VALUE #( key = |{ <ls_tor_root_req_old>-tor_id ALPHA = OUT }|
                appsys      = mo_ef_parameters->get_appsys( )
                appobjtype  = is_app_object-appobjtype
                appobjid    = |{ is_app_object-appobjid ALPHA = OUT }|
                trxcod      = lv_tutrxcod
                trxid       = lv_trxid ) TO lt_track_id_data_old.

      ENDLOOP.
    ENDLOOP.

    zcl_gtt_sts_tools=>get_track_obj_changes_v2(
      EXPORTING
        is_app_object        = is_app_object
        iv_appsys            = mo_ef_parameters->get_appsys( )
        it_track_id_data_new = lt_track_id_data_new
        it_track_id_data_old = lt_track_id_data_old
      CHANGING
        ct_track_id_data     = et_track_id_data ).

  ENDMETHOD.


  METHOD get_requirement_doc_list.

    FIELD-SYMBOLS:
      <ls_tor_root>        TYPE /scmtms/s_em_bo_tor_root.

    DATA:
      lt_req_tor              TYPE /scmtms/t_tor_root_k,
      lv_freight_unit_line_no TYPE int4.

    ASSIGN ir_data->* TO <ls_tor_root>.
    IF sy-subrc <> 0.
      MESSAGE e010(zgtt_sts) INTO DATA(lv_dummy) ##needed.
      zcl_gtt_sts_tools=>throw_exception( ).
    ENDIF.

    DATA(lo_tor_srv_mgr) = /bobf/cl_tra_serv_mgr_factory=>get_service_manager( iv_bo_key = /scmtms/if_tor_c=>sc_bo_key ).

    lo_tor_srv_mgr->retrieve_by_association(
      EXPORTING
        iv_node_key     = /scmtms/if_tor_c=>sc_node-root
        it_key          = VALUE #( ( key = <ls_tor_root>-node_id ) )
        iv_association  = /scmtms/if_tor_c=>sc_association-root-req_tor
        iv_before_image = iv_old_data
      IMPORTING
        et_key_link     = DATA(lt_capa2req_link) ).

    lo_tor_srv_mgr->retrieve_by_association(
      EXPORTING
        iv_node_key     = /scmtms/if_tor_c=>sc_node-root
        it_key          = CORRESPONDING #( lt_capa2req_link MAPPING key = target_key )
        iv_association  = /scmtms/if_tor_c=>sc_association-root-req_tor
        iv_before_image = iv_old_data
        iv_fill_data    = abap_true
      IMPORTING
        et_data         = lt_req_tor ).

    LOOP AT lt_req_tor INTO DATA(ls_req_tor).

      lv_freight_unit_line_no += 1.
      APPEND lv_freight_unit_line_no TO ct_req_doc_line_no.

      APPEND |{ ls_req_tor-tor_id ALPHA = OUT }| TO ct_req_doc_no.

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
