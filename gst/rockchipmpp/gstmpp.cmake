target_sources(
        ${PROJECT_NAME}
        PRIVATE

        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmpp.c
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmpp.h
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppallocator.c
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppallocator.h
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppdec.c
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppdec.h
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppjpegdec.c
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppjpegdec.h
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppvideodec.c
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppvideodec.h
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppenc.c
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppenc.h
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppjpegenc.c
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppjpegenc.h
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmpph264enc.c
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmpph264enc.h
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmpph265enc.c
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmpph265enc.h
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppvp8enc.c
        ${CMAKE_SOURCE_DIR}/gst-rockchip/gst/rockchipmpp/gstmppvp8enc.h
)

target_compile_definitions(${PROJECT_NAME} PRIVATE HAVE_RGA=1)