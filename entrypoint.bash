#!/bin/bash

_trap_exit() {
  case $1 in
    INT)
      exit 100
      ;;
    TERM)
      exit 101
      ;;
    *)
      exit 102
      ;;
  esac
}

trap "_trap_exit INT" INT
trap "_trap_exit TERM" TERM HUP

export HOST_PORT="${HOST_PORT:-localhost:9010}"
export LOG_REQUESTS="${LOG_REQUESTS:-false}"
export ENABLE_FAULT_INJECTION="${ENABLE_FAULT_INJECTION:-false}"
export FLAGFILE=${FLAGFILE:-}
export FROMENV=${FROMENV:-}
export TRYFROMENV=${TRYFROMENV:-}
export UNDEFOK=${UNDEFOK:-}
export ZETASQL_PRINT_RESOLVED_AST=${ZETASQL_PRINT_RESOLVED_AST:-false}
export ZETASQL_VALIDATE_RESOLVED_AST=${ZETASQL_VALIDATE_RESOLVED_AST:-true}
export ZETASQL_SIMPLE_ITERATOR_CALL_TIME_NOW_ROWS_PERIOD=${ZETASQL_SIMPLE_ITERATOR_CALL_TIME_NOW_ROWS_PERIOD:-'1000'}
export ZETASQL_USE_CUSTOMIZED_FLEX_ISTREAM=${ZETASQL_USE_CUSTOMIZED_FLEX_ISTREAM:-true}
export OUTPUT_ASC_EXPLICITLY=${OUTPUT_ASC_EXPLICITLY:-false}
export ZETASQL_MIN_LENGTH_REQUIRED_FOR_EDIT_DISTANCE=${ZETASQL_MIN_LENGTH_REQUIRED_FOR_EDIT_DISTANCE:-'3'}
export ZETASQL_READ_PROTO_FIELD_OPTIMIZED_PATH=${ZETASQL_READ_PROTO_FIELD_OPTIMIZED_PATH:-true}
export ZETASQL_FORMAT_MAX_OUTPUT_WIDTH=${ZETASQL_FORMAT_MAX_OUTPUT_WIDTH:-'1048576'}
export ZETASQL_CAST_FORMAT_STRING_MAX_WIDTH=${ZETASQL_CAST_FORMAT_STRING_MAX_WIDTH:-'1048576'}
export ZETASQL_TYPE_FACTORY_NESTING_DEPTH_LIMIT=${ZETASQL_TYPE_FACTORY_NESTING_DEPTH_LIMIT:-'2147483647'}
export ZETASQL_CALL_VERIFY_NOT_ABORTED_ROWS_PERIOD=${ZETASQL_CALL_VERIFY_NOT_ABORTED_ROWS_PERIOD:-'1000'}
export ZETASQL_SCRIPTING_MAX_NESTING_LEVEL=${ZETASQL_SCRIPTING_MAX_NESTING_LEVEL:-'50'}

/emulator_main \
  --host_port="${HOST_PORT}" \
  --log_requests="${LOG_REQUESTS}" \
  --enable_fault_injection="${ENABLE_FAULT_INJECTION}" \
  --flagfile="${FLAGFILE}" \
  --fromenv="${FROMENV}" \
  --tryfromenv="${TRYFROMENV}" \
  --undefok="${UNDEFOK}" \
  --zetasql_print_resolved_ast="${ZETASQL_PRINT_RESOLVED_AST}" \
  --zetasql_validate_resolved_ast="${ZETASQL_VALIDATE_RESOLVED_AST}" \
  --zetasql_simple_iterator_call_time_now_rows_period="${ZETASQL_SIMPLE_ITERATOR_CALL_TIME_NOW_ROWS_PERIOD}" \
  --zetasql_use_customized_flex_istream="${ZETASQL_USE_CUSTOMIZED_FLEX_ISTREAM}" \
  --output_asc_explicitly="${OUTPUT_ASC_EXPLICITLY}" \
  --zetasql_min_length_required_for_edit_distance="${ZETASQL_MIN_LENGTH_REQUIRED_FOR_EDIT_DISTANCE}" \
  --zetasql_read_proto_field_optimized_path="${ZETASQL_READ_PROTO_FIELD_OPTIMIZED_PATH}" \
  --zetasql_format_max_output_width="${ZETASQL_FORMAT_MAX_OUTPUT_WIDTH}" \
  --zetasql_cast_format_string_max_width="${ZETASQL_CAST_FORMAT_STRING_MAX_WIDTH}" \
  --zetasql_type_factory_nesting_depth_limit="${ZETASQL_TYPE_FACTORY_NESTING_DEPTH_LIMIT}" \
  --zetasql_call_verify_not_aborted_rows_period="${ZETASQL_CALL_VERIFY_NOT_ABORTED_ROWS_PERIOD}" \
  --zetasql_scripting_max_nesting_level="${ZETASQL_SCRIPTING_MAX_NESTING_LEVEL}"

# emulator_main: Warning: SetProgramUsageMessage() never called
#
#   Flags from common/config.cc:
#     --enable_fault_injection (If true, the emulator will inject faults to allow
#       testing application error handling behavior. For instance, transaction
#       Commits may be aborted to facilitate application abort-retry testing.);
#       default: false;
#     --host_port (Emulator host IP and port that serves Cloud Spanner gRPC
#       requests.); default: "localhost:10007";
#     --log_requests (If true, gRPC request and response messages are streamed to
#       the INFO log. This switch is intended for emulator debugging.);
#       default: false;
#
#
#   Flags from external/com_google_absl/absl/flags/parse.cc:
#     --flagfile (comma-separated list of files to load flags from); default: ;
#     --fromenv (comma-separated list of flags to set from the environment [use
#       'export FLAGS_flag1=value']); default: ;
#     --tryfromenv (comma-separated list of flags to try to set from the
#       environment if present); default: ;
#     --undefok (comma-separated list of flag names that it is okay to specify on
#       the command line even if the program does not define a flag with that
#       name); default: ;
#
#
#   Flags from external/com_google_zetasql/zetasql/analyzer/analyzer_impl.cc:
#     --zetasql_print_resolved_ast (Print resolved AST to stdout after resolving
#       (for debugging)); default: false;
#     --zetasql_validate_resolved_ast (Run validator on resolved AST before
#       returning it.); default: true;
#
#
#   Flags from external/com_google_zetasql/zetasql/common/simple_evaluator_table_iterator.cc:
#     --zetasql_simple_iterator_call_time_now_rows_period (Only call
#       zetasql_base::Clock::TimeNow() every this many rows); default: 1000;
#
#
#   Flags from external/com_google_zetasql/zetasql/parser/flex_tokenizer.cc:
#     --zetasql_use_customized_flex_istream (If true, use customized
#       StringStreamWithSentinel to read input.); default: true;
#
#   Flags from external/com_google_zetasql/zetasql/parser/parse_tree.cc:
#     --output_asc_explicitly (If true, outputs the asc explicitly in
#       ASTOrderingExpression::SingleNodeDebugString and
#       Unparser::visitASTOrderingExpression.); default: false;
#
#
#   Flags from external/com_google_zetasql/zetasql/public/catalog_helper.cc:
#     --zetasql_min_length_required_for_edit_distance (Minimum length required of
#       the input string to find its closest match based on edit distance.);
#       default: 3;
#
#   Flags from external/com_google_zetasql/zetasql/public/proto_util.cc:
#     --zetasql_read_proto_field_optimized_path (Use the specialized version of
#       ReadProtoFields which looks for only one field.); default: true;
#
#
#   Flags from external/com_google_zetasql/zetasql/public/functions/format_max_output_width.cc:
#     --zetasql_format_max_output_width (Maximum width of a string returned from
#       the FORMAT function. If a call would result in a wider value, it will fail
#       at runtime.); default: 1048576;
#
#   Flags from external/com_google_zetasql/zetasql/public/functions/input_format_string_max_width.cc:
#     --zetasql_cast_format_string_max_width (Maximum width of input format string
#       for Cast functions. If a inputformat string has a wider value, it will
#       fail at runtime.); default: 1048576;
#
#
#   Flags from external/com_google_zetasql/zetasql/public/types/type_factory.cc:
#     --zetasql_type_factory_nesting_depth_limit (The maximum nesting depth for
#       types that zetasql::TypeFactory will allow to be created. Set this to a
#       bounded value to avoid stack overflows.); default: 2147483647;
#
#
#   Flags from external/com_google_zetasql/zetasql/reference_impl/evaluation.cc:
#     --zetasql_call_verify_not_aborted_rows_period (Only call
#       EvaluationContext::VerifyNotAborted() every this many rows);
#       default: 1000;
#
#
#   Flags from external/com_google_zetasql/zetasql/scripting/parsed_script.cc:
#     --zetasql_scripting_max_nesting_level (Maximum supported number of nested
#       scripting statements in a ZetaSQL script, such as BEGIN...END.);
#       default: 50;
#
# Try --helpfull to get a list of all flags or --help=substring shows help for
# flags which include specified substring in either in the name, or description or
# path.
