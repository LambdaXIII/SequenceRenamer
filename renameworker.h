#ifndef RENAMEWORKER_H
#define RENAMEWORKER_H

#include <QObject>
#include <QFile>

class RenameWorker : public QObject
{
  Q_OBJECT
public:
  explicit RenameWorker(QObject *parent = nullptr);
  explicit RenameWorker(bool _usePrefix, bool _prefixHead, const QString &_prefix, bool _useSuffix, bool _suffixLast, const QString &_suffix, QObject *parent = nullptr);

protected:
  bool usePrefix;
  bool prefixAtHead;
  QString prefixStr;
  bool useSuffix;
  bool suffixAtLast;
  QString suffixStr;

  QString getNewName(const QFile &f);

signals:
  void resultReady(QList<bool> result);

public slots:
  void doWork(const QStringList &sourcePaths);

};

#endif // RENAMEWORKER_H
