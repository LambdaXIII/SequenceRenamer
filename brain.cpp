#include "brain.h"

Brain::Brain(QObject *parent) : QObject(parent)
{

}

bool Brain::isImportable(const QList<QUrl> &urls)
{
  for (QUrl x : urls) {
    if (! x.isLocalFile())
      return false;
  }
  return true;
}



