module.exports = {
  other: {
    title: 'Generic Element',
    value: null,
    luaClass: 'Element',
    description: 'Select this option if you will not use any events from that element, it will still be available in Lua but without any event handlers',
  },
  __elements: {
    title: '- Elements -',
    disabled: true,
  },
  button: {
    title: 'Button',
    value: 'pressable',
    luaClass: 'ManualButton',
    events: [
      { signature: 'onPressed()' },
      { signature: 'onReleased()' },
    ],
  },
  databank: {
    title: 'Databank',
    value: 'databank',
    class: 'DataBankUnit',
    luaClass: 'Databank',
  },
  antigravityGenerator: {
    title: 'Anti-Gravity Generator (AGG)',
    value: 'antigravityGenerator',
    class: 'AntiGravityGeneratorUnit',
    luaclass: 'AntiGravityGenerator',
  },
  core: {
    title: 'Core Unit',
    value: 'core',
    class: 'CoreUnit',
    luaClass: 'CoreUnit',
    events: [
      { signature: 'onStressChanged(stress)' },
    ],
  },
  fuelContainer: {
    title: 'Fuel Container',
    value: 'fuelContainer',
    luaClass: 'Container', // TODO: Waiting on official FuelContainer class, but it should share same API as Container
  },
  itemContainer: {
    title: 'Item Container',
    value: 'itemContainer',
    class: 'ItemContainer',
    luaClass: 'Container',
    events: [
      { signature: 'onContentUpdate()' },
    ],
  },
  gyro: {
    title: 'Gyroscope',
    value: 'gyro',
    luaClass: 'Gyro',
  },
  industry: {
    title: 'Industry Unit',
    value: 'industry',
    class: 'IndustryUnit',
    luaClass: 'Industry',
    events: [
      { signature: 'onStarted(id,quantity)' },
      { signature: 'onCompleted(id,quantity)' },
      { signature: 'onStatusChanged(status)' },
      { signature: 'onBankUpdate()' },
    ],
  },
  laserDetector: {
    title: 'Laser Detector',
    value: 'laserDetector',
    luaClass: 'LaserDetector',
    events: [
      { signature: 'onHit()' },
      { signature: 'onLoss()' },
    ],
  },
  miningUnit: {
    title: 'Mining Unit',
    value: 'miningUnit',
    class: 'MiningUnit',
    luaClass: 'MiningUnit',
    events: [
      { signature: 'onCalibrated(oreId,rate,amount)' },
      { signature: 'onCompleted(oreId,amount)' },
      { signature: 'onStateChanged(status)' },
      { signature: 'onStarted(id)' },
      { signature: 'onStopped()' },
    ],
  },
  plasmaExtractor: {
    title: 'Plasma Extractor',
    value: 'plasmaExtractor',
    class: 'PlasmaExtractorUnit',
    luaClass: 'PlasmaExtractor',
    events: [
      { signature: 'onStarted()' },
      { signature: 'onCompleted()' },
      { signature: 'onStateChanged(status)' },
      { signature: 'onStopped()' },
    ],
  },
  radar: {
    title: 'Radar',
    value: 'radar',
    class: 'RadarPVPUnit',
    luaClass: 'Radar',
    events: [
      { signature: 'onEnter(id)' },
      { signature: 'onLeave(id)' },
      { signature: 'onIdentified(id)' },
    ],
  },
  pvpRadar: {
    title: 'Radar (PVP)',
    value: 'pvpRadar',
    class: 'RadarPVPUnit',
    luaClass: 'Radar',
    events: [
      { signature: 'onEnter(id)' },
      { signature: 'onLeave(id)' },
      { signature: 'onIdentified(id)' },
    ],
  },
  receiver: {
    title: 'Receiver',
    value: 'receiver',
    luaClass: 'Receiver',
    events: [
      { signature: 'onReceived(channel,message)' },
    ],
  },
  screen: {
    title: 'Screen',
    value: 'screen',
    class: 'ScreenUnit',
    luaClass: 'Screen',
    events: [
      { signature: 'onMouseDown(x,y)' },
      { signature: 'onMouseUp(x,y)' },
      { signature: 'onOutputChanged(output)' },
    ],
  },
  shield: {
    title: 'Shield Generator (Ship)',
    value: 'shield',
    class: 'ShieldGeneratorUnit',
    luaClass: 'BaseShieldGenerator', // TODO: Waiting on official ShieldGenerator class
    events: [
      { signature: 'onToggled(active)' },
      { signature: 'onAbsorbed(hitpoints,rawHitpoints)' },
      { signature: 'onVenting(active,restoredHitpoints)' },
      { signature: 'onDown()' },
      { signature: 'onRestored()' },
    ],
  },
  baseShield: {
    title: 'Shield Generator (Base)',
    value: 'baseShield',
    class: 'BaseShieldGeneratorUnit',
    luaClass: 'BaseShieldGenerator',
    events: [
      { signature: 'onToggled(active)' },
      { signature: 'onAbsorbed(hitpoints,rawHitpoints)' },
      { signature: 'onDown()' },
      { signature: 'onRestored()' },
      { signature: 'onEnterLockdown()' },
      { signature: 'onLeaveLockdown()' },
    ],
  },
  transponder: {
    title: 'Transponder',
    value: 'transponder',
    class: 'TransponderUnit',
    luaClass: 'Transponder',
    events: [
      { signature: 'onToggled(active)' },
    ],
  },
  warpDrive: {
    title: 'Warp Drive',
    value: 'warpDrive',
    class: 'WarpDriveUnit',
    luaClass: 'WarpDrive',
  },
  weapon: {
    title: 'Weapon',
    value: 'weapon',
    class: 'WeaponUnit',
    luaClass: 'Weapon',
    events: [
      { signature: 'onReload(id)' },
      { signature: 'onReloaded(id)' },
      { signature: 'onMissed(targetId)' },
      { signature: 'onDestroyed(targetId)' },
      { signature: 'onElementDestroyed(targetId,itemId)' },
      { signature: 'onHit(targetId,damage)' },
    ]
  },
  zoneDetector: {
    title: 'Zone Detector',
    value: 'enterable',
    luaClass: 'DetectionZone',
    events: [
      { signature: 'onEnter(id)' },
      { signature: 'onLeave(id)' },
    ],
  },
  __abstract: {
    title: '- Interfaces -',
    disabled: true,
  },
  enterable: {
    title: 'Enterable',
    value: 'enterable',
    luaClass: 'DetectionZone',
    description: 'Adds the events "enter(id)" and "leave(id)"',
    events: [
      { signature: 'onEnter(id)' },
      { signature: 'onLeave(id)' },
    ],
  },
  pressable: {
    title: 'Pressable',
    value: 'pressable',
    luaClass: 'PressureTile',
    description: 'Adds the events "pressed()" and "released()"',
    events: [
      { signature: 'onPressed()' },
      { signature: 'onReleased()' },
    ],
  },
}