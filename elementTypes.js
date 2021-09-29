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
      { signature: 'pressed()' },
      { signature: 'released()' },
    ],
  },
  databank: {
    title: 'Databank',
    value: 'databank',
  },
  antigravityGenerator: {
    title: 'Anti-Gravity Generator (AGG)',
    value: 'antigravityGenerator',
  },
  core: {
    title: 'Core Unit',
    value: 'core',
    events: [
      { signature: 'pvpTimer(active)' },
      { signature: 'stressChanged(stress)' },
      { signature: 'playerBoarded(pid)' },
      { signature: 'constructDocked(cid)' },
      { signature: 'docked(cid)' },
      { signature: 'undocked(cid)' },
    ],
  },
  fuelContainer: {
    title: 'Fuel Container',
    value: 'fuelContainer',
  },
  gyro: {
    title: 'Gyroscope',
    value: 'gyro',
  },
  industry: {
    title: 'Industry Unit',
    value: 'industry',
    events: [
      { signature: 'completed()' },
      { signature: 'statusChanged(status)' },
    ],
  },
  laserDetector: {
    title: 'Laser Detector',
    value: 'laserDetector',
    events: [
      { signature: 'laserHit()' },
      { signature: 'laserRelease()' },
    ],
  },
  radar: {
    title: 'Radar',
    value: 'radar',
    events: [
      { signature: 'enter(id)' },
      { signature: 'leave(id)' },
    ],
  },
  pvpRadar: {
    title: 'Radar (PVP)',
    value: 'pvpRadar',
    events: [
      { signature: 'enter(id)' },
      { signature: 'leave(id)' },
    ],
  },
  receiver: {
    title: 'Receiver',
    value: 'receiver',
    events: [
      { signature: 'receive(channel,message)' },
    ],
  },
  screen: {
    title: 'Screen',
    value: 'screen',
    events: [
      { signature: 'mouseDown(x,y)' },
      { signature: 'mouseUp(x,y)' },
    ],
  },
  warpDrive: {
    title: 'Warp Drive',
    value: 'warpDrive',
  },
  weapon: {
    title: 'Weapon',
    value: 'weapon',
  },
  zoneDetector: {
    title: 'Zone Detector',
    value: 'enterable',
    events: [
      { signature: 'enter(id)' },
      { signature: 'leave(id)' },
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
      { signature: 'enter(id)' },
      { signature: 'leave(id)' },
    ],
  },
  pressable: {
    title: 'Pressable',
    value: 'pressable',
    description: 'Adds the events "pressed()" and "released()"',
    events: [
      { signature: 'pressed()' },
      { signature: 'released()' },
    ],
  },
}