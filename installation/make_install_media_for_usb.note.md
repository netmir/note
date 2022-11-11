# Make install media (USB)

This method is operation with CUI, it's not use `Media Creation Tool`.

If use `Media Creation Tool` with take easy make install-media on wonderful GUI.


## Table of Contents

1. [Download image](#Download-image)
1. [Mount Windows.iso](#Mount-Windows.iso)
1. [Format USB](#Format-USB)
1. [Copy image data](#Copy-image-data)
1. [Update bootable](#Update-bootable)


## Download-image

* Jump https://www.microsoft.com/en-us/software-download/windows11
* Click `Download Now` on Download Windows 11 Disk Image (ISO)


## Mount-Windows.iso

* Double click to `*.iso`


## Format-USB

Do [diskpart](#How-to-open-diskpart) (Require administrator)

```bat
list disk
select disk [number]
clean
create partition primary
select partition 1
active
format fs=fat32 quick
assign
exit
```

```bat
::Q. What's [number]?
::A. [number] is Disk ### column value.
DISKPART> list disk

  Disk ###  Status         Size     Free     Dyn  Gpt
  --------  -------------  -------  -------  ---  ---
  Disk 0    Online         1863 GB  1024 KB        *
  Disk 1    Online           28 GB      0 B
```


## Copy-image-data

Do [command prompt](#How-to-open-cmd)

```bat
xcopy [srcdrive]*.* /s /e /f [usbdrive]
```

```bat
::EXAMPLE
::ISO-SOURCE(D:\), USB-TARGET(E:\)
xcopy D:\*.* /s /e /f E:\
```


## Update-bootable

Do [command prompt](#How-to-open-cmd) [Require administrator]

```bat
[srcdrive]boot\bootsect /nt60 [usbdrive]
```

```bat
::EXAMPLE
::ISO-SOURCE(D:\), USB-TARGET(E:\)
D:\boot\bootsect /nt60 E:
```


___


## Appendix


### How-to-open-diskpart

* Press `Windows logo key` + `R`
* Type `diskpart`
* Press `Enter`

or

* Run `diskpart` on Command prompt(with administrator)

### How-to-open-cmd

* Press `Windows logo key` + `R`
* Type `cmd`
* Press `Enter` or `Ctrl + Shift + Enter (with administrator)`
