### Rockchip MPP plugin for GStreamer
* This plugin provides a set of GStreamer elements useful for working with Rockchip MPP (Media Processing Platform) hardware codecs.
* In source build on Android platform.
  
### Notice
* build or get `libgstreamer_android.so` first;
* build or get `librockchip_mpp.so` from Rockchip's repos;
* build or get `librga.so` if need enable `HAVE_RGA` option in `rockchipmpp` plugin;
* in the project cmake file, make sure all the dependencies are correctly set:
  ```cmake
    set(GSTREAMER_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/gstreamer-1.22.9/${ANDROID_ABI})
    #set(GSTREAMER_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/gstreamer-1.22.2/${ANDROID_ABI})
    set(ROCKCHIP_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/rockchip-mpp/Release)
    set(RGA_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/librga)
    set(DRM_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/libdrm)
    set(GST_MPP ${CMAKE_CURRENT_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp)

    # gst mpp plugin
    include(${GST_MPP}/gstmpp.cmake)

    target_include_directories(
        ${PROJECT_NAME}
        PRIVATE

        # gstreamer headers
        ${GSTREAMER_ROOT}/include/gstreamer-1.0
        ${GSTREAMER_ROOT}/include/glib-2.0
        ${GSTREAMER_ROOT}/lib/glib-2.0/include
        ${GSTREAMER_ROOT}/lib/gstreamer-1.0/include

        # mpp headers
        ${ROCKCHIP_ROOT}/include

        # rga headers
        ${RGA_ROOT}/include
    )

    target_link_libraries(
  	${CMAKE_PROJECT_NAME}
        PRIVATE

        ${GSTREAMER_ROOT}/lib/libgstreamer_android.so
        ${RGA_ROOT}/lib/librga.so
        ${DRM_ROOT}/lib/libdrm.so
        ${ROCKCHIP_ROOT}/lib/librockchip_mpp.so
    )
  ```
* load the plugin in code:
  ```cpp
    // init gstreamer
	gst_init(nullptr, nullptr); 

    // load rockchipmpp plugin
    GST_PLUGIN_STATIC_DECLARE(rockchipmpp);
	GST_PLUGIN_STATIC_REGISTER(rockchipmpp);
	GstPlugin* rockchip_mpp = gst_plugin_load_by_name("rockchipmpp");
	if (rockchip_mpp) {
		LOGI(TAG, "rockchipmpp loaded");
	} else {
		LOGE(TAG, "rockchipmpp not found");
	}
  ```  

### Example of pipeline
* decode rtsp stream and display on screen:
  ```cpp
  auto pipeline_desc = g_strdup_printf(
    "rtspsrc location=%s name=source latency=50 protocols=4 tcp-timeout=5000000 ! queue ! rtph264depay ! h264parse ! mppvideodec ! queue ! glimagesink",
    uri.c_str());

  GError* error = nullptr;
  pipeline = gst_parse_launch(pipeline_desc, &error);
  g_free(pipeline_desc);
  if (pipeline == nullptr || error != nullptr) {
    LOGE(TAG, "failed to create pipeline, erorr: %s", error->message);
    return;
  }
  ```  
