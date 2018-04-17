#ifndef BRAIN_H
#define BRAIN_H

#include <QObject>
#include <QList>
#include <QUrl>
#include <QQmlEngine>
#include <QJSEngine>

class Brain : public QObject
{
  Q_OBJECT
public:
  explicit Brain(QObject *parent = nullptr);

  Q_INVOKABLE static bool isImportable(const QList<QUrl> &urls);

signals:

public slots:
};

//static QObject* brain_singleton_provider(QQmlEngine *engine, QJSEngine *scriptEngine);


#endif // BRAIN_H
