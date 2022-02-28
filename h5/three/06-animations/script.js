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

const clock = new THREE.Clock()

//Animation 
const tick = () => {
    //time
    //const time = Date.now()

    //clock
    const elapseTime = clock.getElapsedTime()

    // update objects
    //mesh.position.x += -0.01
    //mesh.rotation.x += 0.01

    //曲线运动
    //mesh.position.y = Math.sin(elapseTime)

    //圆形运动
    mesh.position.y = 3 * Math.sin(elapseTime)
    mesh.position.x = 3 * Math.cos(elapseTime)

    camera.lookAt(mesh.position)

    //render
    renderer.render(scene, camera)
    //call next
   window.requestAnimationFrame(tick)
}

tick()