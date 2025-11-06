# List of all object files for this driver
esphosted-objs := main.o spi/esp_spi.o esp_bt.o esp_cmd.o esp_utils.o esp_cfg80211.o esp_stats.o esp_debugfs.o esp_log.o

# Name of the module object to create
esp32_spi-y := $(esphosted-objs)

# Conditional compilation: built-in (y) or module (m) via CONFIG_ESPHOSTED
obj-$(CONFIG_ESPHOSTED) := esp32_spi.o

# Find the .h files
ccflags-y += -I$(src)/include -I$(src)/spi

# Per-file flags: define DEBUG only for esp_log.o
CFLAGS_esp_log.o = -DDEBUG

