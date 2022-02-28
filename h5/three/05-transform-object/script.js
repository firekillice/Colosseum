//scene
const scene = new THREE.Scene()

//objects
const group = new THREE.Group()
scene.add(group)
const cube1 = new THREE.Mesh(
    new THREE.BoxGeometry(1,1,1),
    new THREE.MeshBasicMaterial({"color": '#f00'})
)
group.add(cube1)
const cube2 = new THREE.Mesh(
    new THREE.BoxGeometry(1,1,1),
    new THREE.MeshBasicMaterial({"color": '#0f0'})
)
group.add(cube2)

cube1.position.x = -2
group.position.y = 1
group.rotation.x = 2


//object
const geometry = new THREE.BoxGeometry( 1, 1, 1)
const marterial = new THREE.MeshBasicMaterial({color: '#f00'})
const mesh = new THREE.Mesh(geometry, marterial)
mesh.position.x = 2
//scene.add(mesh)
mesh.position.set(0.7, -0.6, 2)
mesh.scale.x = 2
mesh.scale.set(2,1,2)

mesh.rotation.x = 2




const sizes = {
    width: 800,
    height: 600
}

//camera
const camera = new THREE.PerspectiveCamera(75, sizes.width/sizes.height)
camera.position.x = 1
camera.position.z = 5
camera.position.y = 1
scene.add(camera)

//axes helper
const axesHelper = new THREE.AxesHelper(2)
scene.add(axesHelper)
//console.log(camera.position.distanceTo(mesh.position))
//mesh.position.normalize() //向量的值都变为1

//屏幕
const canvas = document.querySelector(".webgl")
console.log(canvas)

//渲染器
const renderer = new THREE.WebGLRenderer({
    canvas: canvas
})
renderer.setSize(sizes.width, sizes.height)


renderer.render(scene, camera)
