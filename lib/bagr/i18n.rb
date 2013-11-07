require 'i18n'

en = {
  starting:                    'Starting',
  bargified:                   'Bagrified',
  starting:                    'Starting',
  start:                       'Start',
  update:                      'Update',
  finalize:                    'Finalise',
  finishing:                   'Finishing',
  finished:                    'Finished',
  written_file:                'create %{file}',
  question:                    'Please enter %{key}: |%{default_value}|',
  build_failed:                'The build has failed with an error: %{ex}',
  revision_log_message:        'Branch %{branch} (at %{sha}) build as release %{release} by %{user}',
  build_failed:                'The build has failed with an error: %{ex}',
}

I18n.backend.store_translations(:en, { bagr: en })
