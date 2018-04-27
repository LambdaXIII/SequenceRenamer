#ifndef BRAIN_H
#define BRAIN_H

#include <QtCore>
#include <QObject>
#include <QList>
#include <QUrl>
#include <QQmlEngine>
#include <QJSEngine>
#include <QFile>
#include <QFileInfo>
#include <QFutureWatcher>
#include <QtConcurrent>

class Brain : public QObject
{
  Q_OBJECT
//  Q_PROPERTY(int totalCount READ totalCount NOTIFY totalCountChanged)
//  Q_PROPERTY(int currentCount READ currentCount NOTIFY currentCountChanged)
//  Q_PROPERTY(double progress READ progress NOTIFY progressChanged)

public:
  explicit Brain(QObject *parent = nullptr);
  ~Brain();
//  int totalCount() const;
//  int currentCount() const;
//  double progress() const;

  Q_INVOKABLE static bool isImportable(const QList<QUrl> &urls);

  Q_INVOKABLE void doIt(const QList<QUrl> &urls,
                        bool usePrefix,
                        bool prefixHead,
                        const QString &prefixS,
                        bool useSuffix,
                        bool suffixLast,
                        const QString &suffixS);

  QThread *workThread;

//  QFutureWatcher *futureWatcher;

  Q_INVOKABLE static QString tryIt(const QUrl &url);
private:

  static QStringList expandFolders(const QStringList &list);
  static QString get_new_name(const QFile &file);
  static bool actual_rename_function(const QString &path);

signals:
//  void totalCountChanged(int count);
//  void currentCountChanged(int count);
//  void progressChanged(double progress);
  void startTheWork(const QStringList &list);
  void renameStarted();
  void renameFinished();
//  void messageChanged(QString message);

public slots:

};

//static QObject* brain_singleton_provider(QQmlEngine *engine, QJSEngine *scriptEngine);


#endif // BRAIN_H
