QT += quick

SOURCES += \
        main.cpp

resources.files += main.qml \
                   PathCurveWorkWindow.qml \
                   PathLineWorkWindow.qml  \
                   PathQuadWorkWindow.qml \
                   PathCubicWorkWindow.qml \
                   PathPolylineWorkWindow.qml \
                   PathArcWorkWindow.qml

resources.prefix = /$${TARGET}
RESOURCES += resources \
    images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    ../../Downloads/check-mark.png \
    PathArcWorkWindow.qml \
    PathCubicWorkWindow.qml \
    PathCurveWorkWindow.qml \
    PathLineWorkWindow.qml \
    PathPolylineWorkWindow.qml \
    PathQuadWorkWindow.qml
