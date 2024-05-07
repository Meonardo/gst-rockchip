target_sources(
        ${PROJECT_NAME}
        PRIVATE

        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmpp.c
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmpp.h
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppallocator.c
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppallocator.h
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppdec.c
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppdec.h
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppjpegdec.c
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppjpegdec.h
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppvideodec.c
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppvideodec.h
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppenc.c
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppenc.h
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppjpegenc.c
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppjpegenc.h
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmpph264enc.c
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmpph264enc.h
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmpph265enc.c
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmpph265enc.h
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppvp8enc.c
        ${CMAKE_SOURCE_DIR}/gst-mpp/gstmppvp8enc.h
)

target_compile_definitions(${PROJECT_NAME} PRIVATE HAVE_RGA=1)