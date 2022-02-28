import "./style.css";
import * as THREE from "three";
import ky from "kyouka";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls.js";

//cursor
const cursor = {
  x: 0,
  y: 0
}
window.addEventListener("mousemove", (event) => {
  //转化为0-1的区间
  cursor.x = event.clientX/sizes.width - 0.5
  cursor.y = event.clientY/sizes.height - 0.5
})

//屏幕
const canvas = document.querySelector(".webgl")
console.log(canvas)

//scene
const scene = new THREE.Scene()

//object
const geometry = new THREE.BoxGeometry(1, 1, 1)
const marterial = new THREE.MeshBasicMaterial({ color: '#f00' })
const mesh = new THREE.Mesh(geometry, marterial)
scene.add(mesh)

const sizes = {
  width: window.innerWidth,
  height: window.innerHeight
}

//camera
const camera = new THREE.PerspectiveCamera(50, sizes.width / sizes.height, 1, 1000)
//const camera = new THREE.OrthographicCamera(-1, 1, 1, -1, 0.1, 100)
camera.position.x = 0
camera.position.z = 5
camera.position.y = 0
//camera.lookAt(mesh.position)
scene.add(camera)

//control
const control = new OrbitControls(camera, canvas)
control.enableDamping = true

//渲染器
const renderer = new THREE.WebGLRenderer({
  canvas: canvas
})
renderer.setSize(sizes.width, sizes.height)

renderer.render(scene, camera)

const clock = new THREE.Clock()

//Animation 
const tick = () => {
  // mesh.rotation.x += 0.01
  //旋转控制
/*   camera.position.x = Math.sin(cursor.x * Math.PI * 2) * 3
  camera.position.z = Math.cos(cursor.x * Math.PI * 2) * 3
  camera.position.y = cursor.y * 5
  camera.lookAt(mesh.position) */

  control.update()

  //render
  renderer.render(scene, camera)
  //call next
  window.requestAnimationFrame(tick)
}

tick()