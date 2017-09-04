# Insert new variables inside the Lineage structure
wave_soong:
	$(hide) mkdir -p $(dir $@)
	$(hide) (\
	echo '{'; \
	echo '"Wave": {'; \
	echo '},'; \
	echo '') > $(SOONG_VARIABLES_TMP)
