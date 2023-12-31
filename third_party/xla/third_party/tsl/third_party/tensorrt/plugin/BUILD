# NVIDIA TensorRT Open Source Plugins
# This package contains build targets for select TensorRT plugins included in the
# TensorRT open source repository.
load("@local_config_cuda//cuda:build_defs.bzl", "cuda_default_copts", "cuda_library")

exports_files(
    ["LICENSE"],
    visibility = ["//visibility:public"],
)

cuda_library(
    name = "plugin_common",
    srcs = [
        "plugin/common/kernels/common.cu.cc",
    ],
    hdrs = [
        "plugin/common/bboxUtils.h",
        "plugin/common/checkMacrosPlugin.h",
        "plugin/common/plugin.h",
    ],
    strip_include_prefix = "plugin/common",
    visibility = ["//visibility:public"],
    deps = [
        "@local_config_tensorrt//:tensorrt",
        "@local_config_tensorrt//:tensorrt_headers",
    ],
)

cc_library(
    name = "nms_plugin_hdrs",
    hdrs = [
        "plugin/efficientNMSPlugin/efficientNMSInference.h",
        "plugin/efficientNMSPlugin/efficientNMSParameters.h",
        "plugin/efficientNMSPlugin/efficientNMSPlugin.h",
    ],
    visibility = ["//visibility:public"],
)

cuda_library(
    name = "nvinfer_plugin_nms",
    srcs = [
        "plugin/efficientNMSPlugin/efficientNMSInference.cu.cc",
        "plugin/efficientNMSPlugin/efficientNMSInference.cu.h",
        "plugin/efficientNMSPlugin/efficientNMSInference.h",
        "plugin/efficientNMSPlugin/efficientNMSParameters.h",
        "plugin/efficientNMSPlugin/efficientNMSPlugin.cpp",
        "plugin/efficientNMSPlugin/efficientNMSPlugin.h",
    ],
    hdrs = [
        "plugin/efficientNMSPlugin/efficientNMSInference.h",
        "plugin/efficientNMSPlugin/efficientNMSParameters.h",
        "plugin/efficientNMSPlugin/efficientNMSPlugin.h",
    ],
    copts = cuda_default_copts(),
    include_prefix = "third_party/tensorrt/plugin/efficientNMSPlugin",
    strip_include_prefix = "plugin/efficientNMSPlugin",
    visibility = ["//visibility:public"],
    deps = [
        ":nms_plugin_hdrs",
        ":plugin_common",
        "@local_config_tensorrt//:tensorrt",
        "@local_config_tensorrt//:tensorrt_headers",
    ],
)
