#ifndef RENAMEWORKER_H
#define RENAMEWORKER_H

#include <QObject>
#include <QFile>

class RenameWorker : public QObject
{
  Q_OBJECT
public:
//  explicit RenameWorker(QObject *parent = nullptr);
protected:
  static QString getNewName(const QFile &f);

signals:
  void resultReady(QList<bool> result);
//  void totalCountChanged(int x);
//  void currentCountChanged(int x);
//  void errorDetected(QString path);
//  void messageChanged(QString message);

public slots:
  void doWork(const QStringList &sourcePaths);

};

#endif // RENAMEWORKER_H
