# select2-selenium-reproducer

Reproduces a bug in either select2 or selenium where an opening parethesis does not end up in the input field of select2. There is also a keylogger to show that the corresponding key actually is sent to the browser.

This preproducer inputs 'Thurgau (Schweiz)' via selenium into the select2 field, but won't find the entry due to the above mentioned issue. This is reproducible in Firefox, but not in Chromium.

## Reproduce
- Run run.sh
