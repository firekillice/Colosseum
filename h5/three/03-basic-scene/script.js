//scene
const scene = new THREE.Scene()

//object
const geometry = new THREE.BoxGeometry( 1, 1, 1)
const marterial = new THREE.MeshBasicMaterial({color: '#f00'})
const mesh = new THREE.Mesh(geometry, marterial)
scene.add(mesh)

const sizes = {
    width: 800,
    height: 600
}

//camera
const camera = new THREE.PerspectiveCamera(75, sizes.width/sizes.height)
camera.position.x = 0
camera.position.z = 5
camera.position.y = 0
scene.add(camera)

//屏幕
const canvas = document.querySelector(".webgl")
console.log(canvas)

//渲染器
const renderer = new THREE.WebGLRenderer({
    canvas: canvas
})
renderer.setSize(sizes.width, sizes.height)


renderer.render(scene, camera)
