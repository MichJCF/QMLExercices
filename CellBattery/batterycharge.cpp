#include "batterycharge.h"
#include <QDebug>

BatteryCharge::BatteryCharge(QObject *parent)
    : QObject{parent}
{

}
///////// UP
void BatteryCharge::incrementBattery(float level)
{
    m_value += level;
    if(m_value>=1.00){
        m_value = 1.00;
    }
    qDebug() << QString::number(m_value, 'f', 2);
    emit batteryLevelUp(m_value);
}

void BatteryCharge::incrementValue()
{
    incrementBattery(0.01);
    //decrementBattery(0.1);
}

////////// DOWN

void BatteryCharge::decrementBattery(float level)
{
    m_value -= level;
    if(m_value<=0.00){
        m_value = 0.00;
    }
    qDebug() << QString::number(m_value, 'f', 2);
    emit batteryLevelDown(m_value);
}

void BatteryCharge::decrementValue()
{
    decrementBattery(0.01);
}
