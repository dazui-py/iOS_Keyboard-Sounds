#!/system/bin/sh
# Keyboard_Sound_IOS — customize.sh

ui_print " "
ui_print "********************************"
ui_print "   Keyboard_Sound_IOS v1.0.0"
ui_print "      by dazui-py"
ui_print "********************************"
ui_print " "

ENV_NAME="Magisk"
ENV_VER=""
ENV_CODE=""

if [ -n "$KSU" ]; then
  ENV_NAME="KernelSU"
  ENV_VER="$KSU_VER"
  ENV_CODE="$KSU_VER_CODE"
  if [ -n "$KSU_VER_CODE" ]; then
    case "$KSU_VER_CODE" in
      ''|*[!0-9]*)
        ;;
      *)
        if [ "$KSU_VER_CODE" -ge 20000 ]; then
          ENV_NAME="KernelSU Next"
        fi
        ;;
    esac
  fi
elif [ -n "$APATCH" ]; then
  ENV_NAME="APatch"
  ENV_VER="$APATCH_VER"
  ENV_CODE="$APATCH_VER_CODE"
else
  ENV_NAME="Magisk"
  ENV_VER="$MAGISK_VER"
  ENV_CODE="$MAGISK_VER_CODE"
fi

ui_print "[+] Ambiente: $ENV_NAME"
ui_print "[+] Versao: $ENV_VER code: $ENV_CODE"
ui_print " "

API="$(getprop ro.build.version.sdk)"
ANDROID_VER="$(getprop ro.build.version.release)"

[ -n "$API" ] || API="0"
[ -n "$ANDROID_VER" ] || ANDROID_VER="unknown"

ui_print "[+] Android: $ANDROID_VER API $API"

SOUND_DIR="$MODPATH/system/product/media/audio"
LEGACY_DIR="$MODPATH/system/media/audio"

case "$API" in
  ''|*[!0-9]*)
    API=0
    ;;
esac

if [ "$API" -lt 31 ]; then
  ui_print "[*] Android 11 ou anterior detectado"
  mkdir -p "$LEGACY_DIR/ui"
  if [ -d "$SOUND_DIR/ui" ]; then
    cp -af "$SOUND_DIR/ui/." "$LEGACY_DIR/ui/" 2>/dev/null
  fi
  SOUND_DIR="$LEGACY_DIR"
else
  ui_print "[+] Caminho prioritario: system/product/media/audio"
fi

ui_print " "

KEYBOARD_COUNT=0

if [ -f "$SOUND_DIR/ui/KeypressStandard.ogg" ]; then
  KEYBOARD_COUNT=`expr "$KEYBOARD_COUNT" + 1`
fi
if [ -f "$SOUND_DIR/ui/KeypressSpacebar.ogg" ]; then
  KEYBOARD_COUNT=`expr "$KEYBOARD_COUNT" + 1`
fi
if [ -f "$SOUND_DIR/ui/KeypressDelete.ogg" ]; then
  KEYBOARD_COUNT=`expr "$KEYBOARD_COUNT" + 1`
fi
if [ -f "$SOUND_DIR/ui/KeypressReturn.ogg" ]; then
  KEYBOARD_COUNT=`expr "$KEYBOARD_COUNT" + 1`
fi
if [ -f "$SOUND_DIR/ui/KeypressInvalid.ogg" ]; then
  KEYBOARD_COUNT=`expr "$KEYBOARD_COUNT" + 1`
fi

ui_print "[+] Sons de teclado encontrados: $KEYBOARD_COUNT"

set_perm_recursive "$MODPATH" 0 0 0755 0644

if [ -d "$MODPATH/system/product/media/audio" ]; then
  set_perm_recursive "$MODPATH/system/product/media/audio" 0 0 0755 0644 u:object_r:system_file:s0
fi

if [ -d "$MODPATH/system/media/audio" ]; then
  set_perm_recursive "$MODPATH/system/media/audio" 0 0 0755 0644 u:object_r:system_file:s0
fi

ui_print " "
ui_print "********************************"
ui_print "       Instalacao concluida"
ui_print "********************************"
ui_print "[+] Sons de teclado iOS instalados"
ui_print "[+] Ficheiros detectados: $KEYBOARD_COUNT"
ui_print "[+] Compativel com: $ENV_NAME"
ui_print "[+] Reinicie o dispositivo"
ui_print " "

return 0 2>/dev/null
exit 0��════╗"
ui_print "║         Instalação Concluída!         ║"
ui_print "║                                       ║"
ui_print "║  ✓ Sons de teclado iOS instalados     ║"
ui_print "║  ✓ Ficheiros detectados: $KEYBOARD_COUNT              ║"
ui_print "║  ✓ Compatível com $ENV_NAME           ║"
ui_print "║                                       ║"
ui_print "║  Reinicie o dispositivo para aplicar. ║"
ui_print "╚═══════════════════════════════════════╝"
ui_print " "

return 0 2>/dev/null
exit 0DIR_LEGACY/ui/" 2>/dev/null
    ui_print "[✓] Sons espelhados para system/media/audio/ui"
  fi
fi

ui_print " "

KEYBOARD_COUNT=0

[ -f "$SOUND_DIR/ui/KeypressStandard.ogg" ] && KEYBOARD_COUNT=$((KEYBOARD_COUNT + 1))
[ -f "$SOUND_DIR/ui/KeypressSpacebar.ogg" ] && KEYBOARD_COUNT=$((KEYBOARD_COUNT + 1))
[ -f "$SOUND_DIR/ui/KeypressDelete.ogg" ] && KEYBOARD_COUNT=$((KEYBOARD_COUNT + 1))
[ -f "$SOUND_DIR/ui/KeypressReturn.ogg" ] && KEYBOARD_COUNT=$((KEYBOARD_COUNT + 1))
[ -f "$SOUND_DIR/ui/KeypressInvalid.ogg" ] && KEYBOARD_COUNT=$((KEYBOARD_COUNT + 1))

ui_print "[✓] Sons de teclado encontrados: $KEYBOARD_COUNT ficheiros"

if [ -f "/data/adb/modules/magisk_overlayfs/util_functions.sh" ] && \
   /data/adb/modules/magisk_overlayfs/overlayfs_system --test >/dev/null 2>&1; then
  ui_print "[*] Magisk OverlayFS detectado, a configurar suporte"
  . /data/adb/modules/magisk_overlayfs/util_functions.sh
  support_overlayfs && rm -rf "$MODPATH/system"
  ui_print "[✓] OverlayFS configurado"
  ui_print " "
fi

set_perm_recursive "$MODPATH" 0 0 0755 0644

if [ -d "$MODPATH/system/product/media/audio" ]; then
  set_perm_recursive "$MODPATH/system/product/media/audio" 0 0 0755 0644 u:object_r:system_file:s0
fi

if [ -d "$MODPATH/system/media/audio" ]; then
  set_perm_recursive "$MODPATH/system/media/audio" 0 0 0755 0644 u:object_r:system_file:s0
fi

sleep 1
ui_print "╔═══════════════════════════════════════╗"
ui_print "║         Instalação Concluída!         ║"
ui_print "║                                       ║"
ui_print "║  ✓ Sons de teclado iOS instalados     ║"
ui_print "║  ✓ Ficheiros detectados: $KEYBOARD_COUNT              ║"
ui_print "║  ✓ Compatível com $ENV_NAME           ║"
ui_print "║                                       ║"
ui_print "║  Reinicie o dispositivo para aplicar. ║"
ui_print "╚═══════════════════════════════════════╝"
ui_print " ""rop ro.product.manufacturer | tr '[:upper:]' '[:lower:]')
OEM_FOUND=false

ui_print "[*] Fabricante: $MANUFACTURER"
ui_print "[*] Verificando fontes OEM no sistema real..."

# List of known OEM emoji font files to check
OEM_FONTS="SamsungColorEmoji.ttf LGNotoColorEmoji.ttf HTC_ColorEmoji.ttf MiuiColorEmoji.ttf OnePlusEmoji.ttf HuaweiColorEmoji.ttf"

for oem_font in $OEM_FONTS; do
  if [ -f "/system/fonts/${oem_font}" ]; then
    cp "$FONT_FILE" "$MODPATH/system/fonts/${oem_font}"
    ui_print "[✓] Detectado ${oem_font} — substituição criada"
    OEM_FOUND=true
  fi
done

if [ "$OEM_FOUND" = false ]; then
  ui_print "[✓] ROM AOSP/Pixel — usando NotoColorEmoji.ttf padrão"
fi
ui_print " "

# ── Clear Gboard cache and Downloaded Fonts (ONE TIME, only during installation) ──
ui_print "[*] Limpando fontes cacheadas (Gboard/Play Services)..."
rm -rf /data/fonts/files/* 2>/dev/null
ui_print "[✓] Fontes cacheadas removidas"

if [ -d /data/data/com.google.android.inputmethod.latin ]; then
  ui_print "[*] Limpando cache do Gboard..."
  find /data -type d -path '*inputmethod.latin*/*cache*' -exec rm -rf {} + 2>/dev/null
  rm -rf /data/data/com.google.android.inputmethod.latin/files/emoji/* 2>/dev/null
  rm -rf /data/data/com.google.android.inputmethod.latin/files/superpacks/emoji* 2>/dev/null
  am force-stop com.google.android.inputmethod.latin 2>/dev/null
  ui_print "[✓] Cache do Gboard limpo"
else
  ui_print "[*] Gboard não encontrado — pulando limpeza de cache"
fi
ui_print " "

# ── OverlayFS support (for Magisk with magic_overlayfs module) ──
if [ -f "/data/adb/modules/magisk_overlayfs/util_functions.sh" ] && \
  /data/adb/modules/magisk_overlayfs/overlayfs_system --test 2>/dev/null; then
  ui_print "[*] Magisk OverlayFS detectado — adicionando suporte"
  . /data/adb/modules/magisk_overlayfs/util_functions.sh
  support_overlayfs && rm -rf "$MODPATH/system"
  ui_print "[✓] OverlayFS configurado"
  ui_print " "
fi

# ── Set permissions ──
# set_perm_recursive already applies u:object_r:system_file:s0 by default
set_perm_recursive $MODPATH 0 0 0755 0644

# Enforce correct SELinux context for all system files
# This is CRITICAL for android's audioserver to be able to read the files
if [ -d "$MODPATH/system/product/media/audio" ]; then
  set_perm_recursive "$MODPATH/system/product/media/audio" 0 0 0755 0644 u:object_r:system_file:s0
fi

if [ -d "$MODPATH/system/media/audio" ]; then
  set_perm_recursive "$MODPATH/system/media/audio" 0 0 0755 0644 u:object_r:system_file:s0
fi

if [ -d "$MODPATH/system/fonts" ]; then
  set_perm_recursive "$MODPATH/system/fonts" 0 0 0755 0644 u:object_r:system_file:s0
fi

# ── Summary ──
sleep 0.5
ui_print "╔═══════════════════════════════════════╗"
ui_print "║         Instalação Concluída!          ║"
ui_print "║                                        ║"
ui_print "║  ✓ Emojis iOS instalados               ║"
ui_print "║  ✓ Sons iOS instalados ($UI_COUNT UI)          ║"
ui_print "║  ✓ Fonte SF Pro Display instalada      ║"
ui_print "║  ✓ Compatível com $ENV_NAME            ║"
ui_print "║                                        ║"
ui_print "║  Reinicie o dispositivo para aplicar.  ║"
ui_print "╚═══════════════════════════════════════╝"
ui_print " "
