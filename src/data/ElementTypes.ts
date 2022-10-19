import { ElementTypeOrCategoryList } from "../types/ElementType";

/**
 * The list of known element types
 */
const registeredElementTypes: ElementTypeOrCategoryList = {
  other: {
    title: 'Generic Element',
    value: 'element',
    class: 'Element',
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
    class: 'ManualButton',
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
    luaClass: 'AntiGravityGenerator',
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
    title: 'Fuel Container (Any/Generic)',
    value: 'fuelContainer',
    class: 'FuelContainer',
    luaClass: 'Container',
  },
  fuelContainerAtmo: {
    title: 'Fuel Container (Atmospheric)',
    value: 'fuelContainerAtmo',
    class: 'AtmoFuelContainer',
    luaClass: 'Container',
  },
  fuelContainerSpace: {
    title: 'Fuel Container (Space)',
    value: 'fuelContainerSpace',
    class: 'SpaceFuelContainer',
    luaClass: 'Container',
  },
  fuelContainerRocket: {
    title: 'Fuel Container (Rocket)',
    value: 'fuelContainerRocket',
    class: 'RocketFuelContainer',
    luaClass: 'Container',
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
    class: 'Gyro',
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
    class: 'LaserDetector',
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
    class: 'Receiver',
    luaClass: 'Receiver',
    events: [
      { signature: 'onReceived(channel,message)' },
    ],
  },
  emitter: {
    title: 'Emitter',
    value: 'emitter',
    class: 'Emitter',
    luaClass: 'Emitter',
    events: [
      { signature: 'onSent(channel,message)' },
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
    luaClass: 'ShieldGenerator',
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
  spaceEngine: {
      title: "Space Engine",
      value: "spaceEngine",
      class: "SpaceEngine",
      luaClass: "SpaceEngine"
  },
  atmoEngine: {
      title: "Atmo Engine",
      value: "atmoEngine",
      class: "AtmosphericEngine",
      luaClass: "AtmosphericEngine"
  },
  zoneDetector: {
    title: 'Zone Detector',
    value: 'enterable',
    class: 'DetectionZone',
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
    class: 'DetectionZone',
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
    class: 'PressureTile',
    luaClass: 'PressureTile',
    description: 'Adds the events "pressed()" and "released()"',
    events: [
      { signature: 'onPressed()' },
      { signature: 'onReleased()' },
    ],
  },
};

// Makes our list public
export default registeredElementTypes;
