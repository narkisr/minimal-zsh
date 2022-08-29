
usb_attach(){
  match=`lsusb | grep $2 | cut -d ' ' -f 6`
  id=`echo $match| awk -F':' '{print $1}'`
  vendor=`echo $match| awk -F':' '{print $2}'`

  virsh $3-device "$1" /dev/stdin <<END
<hostdev mode="subsystem" type="usb" managed="yes">
  <source>
    <vendor id="0x$id"/>
    <product id="0x$vendor"/>
  </source>
  <alias name="hostdev0"/>
  <address type="usb" bus="0" port="4"/>
</hostdev>
END
}
