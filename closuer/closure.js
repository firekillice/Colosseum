	function testCloure() {
                var i = 5
                return function () {
                    i = i + 1
					return i
                }
            }
			
            function testing(){
                var c2 = testCloure()
                console.log(c2())
                console.log(c2())
                console.log(c2())
                console.log(c2())
            }
			testing();
