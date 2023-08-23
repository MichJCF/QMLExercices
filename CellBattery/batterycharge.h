#ifndef BATTERYCHARGE_H
#define BATTERYCHARGE_H

#include <QObject>

class BatteryCharge : public QObject
{
    Q_OBJECT

public:
    explicit BatteryCharge(QObject *parent = nullptr);

signals:
    void batteryLevelUp(float newBatteryLevelUp);
    void batteryLevelDown(float newBatteryLevelDown);

public slots:
    void incrementBattery(float level);
    void incrementValue();
    void decrementBattery(float level);
    void decrementValue();

private:
    float m_value = 0.0;
};

#endif // BATTERYCHARGE_H
