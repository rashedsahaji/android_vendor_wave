for combo in $(curl -s https://raw.githubusercontent.com/Wave-Project/android_vendor_wave/pie/wave.devices | sed -e 's/#.*$//' | awk '{printf "wave_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done
