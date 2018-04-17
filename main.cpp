#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include "brain.h"

QObject* brain_singleton_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
  Q_UNUSED(engine)
  Q_UNUSED(scriptEngine)

  Brain *single = new Brain();
  return single;
}


int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

  QGuiApplication app(argc, argv);

  qmlRegisterSingletonType<Brain>("SequenceRenamer.OwnApi", 1, 0, "Brain", brain_singleton_provider);

  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty())
    return -1;

  return app.exec();
}
