#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "qlocaldevice.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    //register our form processor class as singleton as we dont want to create memory overheads
      QScopedPointer<QLocalDevice> singletonprocessor(new QLocalDevice);

      qmlRegisterSingletonInstance("com.company.localdevice", 1, 0, "LocalDevice", singletonprocessor.get()); //register our singleton

      //register the data model which will be used to hold/display the rewards to the UI
      //qmlRegisterType<RewardsModel>("Rewards",1,0,"RewardsModel");

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
