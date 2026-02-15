TARGET := iphone:clang:latest
ARCHS = arm64
INSTALL_TARGET_PROCESSES = Pro

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = Pro

Pro_FILES = main.m AppDelegate.m ViewController.m
Pro_FRAMEWORKS = UIKit Foundation WebKit
Pro_LDFLAGS += -ldl
Pro_RESOURCE_DIRS = Resources

include $(THEOS_MAKE_PATH)/application.mk