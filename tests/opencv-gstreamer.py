#!/usr/bin/python3

import cv2

# fps: Argument expected to be a string in the format "X/Y"
#   E.g. "30/1" indicates 30FPS and "25/2" indicates equivalent of 12.5FPS
def config_pipeline(width: int=2112, height: int=1568, fps: str="30/1", pixelfmt: str="NV12"):
    return f'''
        rkisp device=/dev/video0 ! \
        video/x-raw,format={pixelfmt},width={width},height={height},framerate={fps} ! \
        videoconvert ! \
        appsink
    '''

if __name__ == "__main__":

    cam_pipeline = config_pipeline()
    cam = cv2.VideoCapture(cam_pipeline, cv2.CAP_GSTREAMER)

    assert cam.isOpened()

    while True:
        ret, frame = cam.read()
        cv2.imshow("GStreamer Pipeline Test", frame)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cam.release()
    cv2.destroyAllWindows()
