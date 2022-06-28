module.exports = {
  other: {
    title: 'Generic Element or Other',
    value: null,
    description: 'Select this option if you will not use any events from that element, it will still be available in Lua but without any event handlers',
  },
  __elements: {
    title: '- Elements -',
    disabled: true,
  },
  button: {
    title: 'Button',
    value: 'pressable',
    events: [
      { signature: 'onPressed()' },
      { signature: 'onReleased()' },
    ],
  },
  databank: {
    title: 'Databank',
    value: 'databank',
    class: 'DataBankUnit'
  },
  antigravityGenerator: {
    title: 'Anti-Gravity Generator (AGG)',
    value: 'antigravityGenerator',
    class: 'AntiGravityGeneratorUnit',
  },
  core: {
    title: 'Core Unit',
    value: 'core',
    class: 'CoreUnit',
    events: [
      { signature: 'onStressChanged(stress)' },
    ],
  },
  fuelContainer: {
    title: 'Fuel Container',
    value: 'fuelContainer',
  },
  itemContainer: {
    title: 'Item Container',
    value: 'itemContainer',
    class: 'ItemContainer',
    events: [
      { signature: 'onContentUpdate()' },
    ],
  },
  gyro: {
    title: 'Gyroscope',
    value: 'gyro',
  },
  industry: {
    title: 'Industry Unit',
    value: 'industry',
    class: 'IndustryUnit',
    events: [
      { signature: 'onStarted(id,quantity)' },
      { signature: 'onCompleted(id,quantity)' },
      { signature: 'onStatusChanged(status)' },
    ],
  },
  laserDetector: {
    title: 'Laser Detector',
    value: 'laserDetector',
    events: [
      { signature: 'onHit()' },
      { signature: 'onLoss()' },
    ],
  },
  miningUnit: {
    title: 'Mining Unit',
    value: 'miningUnit',
    class: 'MiningUnit',
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
    events: [
      { signature: 'onEnter(id)' },
      { signature: 'onLeave(id)' },
      { signature: 'onIdentified(id)' },
    ],
  },
  receiver: {
    title: 'Receiver',
    value: 'receiver',
    events: [
      { signature: 'onReceived(channel,message)' },
    ],
  },
  screen: {
    title: 'Screen',
    value: 'screen',
    class: 'ScreenUnit',
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
    events: [
      { signature: 'onToggled(active)' },
    ],
  },
  warpDrive: {
    title: 'Warp Drive',
    value: 'warpDrive',
    class: 'WarpDriveUnit',
  },
  weapon: {
    title: 'Weapon',
    value: 'weapon',
    class: 'WeaponUnit',
  },
  zoneDetector: {
    title: 'Zone Detector',
    value: 'enterable',
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
    description: 'Adds the events "enter(id)" and "leave(id)"',
    events: [
      { signature: 'onEnter(id)' },
      { signature: 'onLeave(id)' },
    ],
  },
  pressable: {
    title: 'Pressable',
    value: 'pressable',
    description: 'Adds the events "pressed()" and "released()"',
    events: [
      { signature: 'onPressed()' },
      { signature: 'onReleased()' },
    ],
  },
}