/**
 * Copyright (c) 2018 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import MetalKit

extension Renderer {
  func zoom(delta: CGFloat, sensitivity: Float) {
    let cameraVector = camera.modelMatrix.upperLeft().columns.2
    camera.position += Float(delta) * sensitivity * cameraVector
  }
  
  func rotate(translation: float2) {
    let sensitivity: Float = 0.01
    camera.position = float4x4(rotationY: -translation.x * sensitivity).upperLeft() * camera.position
    camera.rotation.y = atan2f(-camera.position.x, -camera.position.z)
  }
}

// ball animations
let ballPositionXArray: [Float] = [-1.0, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1,
                              0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9,
                              1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
                              1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1,
                              0.0, -0.1, -0.2, -0.3, -0.4, -0.5, -0.6, -0.7, -0.8, -0.9,
                              -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0]

/*
func generateBallTranslations() -> [Keyframe] {
  return [
    Keyframe(time: 0,    value: [-1, 0, 0]),
    Keyframe(time: 0.17, value: [0, 0.5, 0]),
    Keyframe(time: 0.35, value: [1, 0, 0]),
    Keyframe(time: 1.0,  value: [1, 0, 0]),
    Keyframe(time: 1.17, value: [0, 0.5, 0]),
    Keyframe(time: 1.35, value: [-1, 0, 0]),
    Keyframe(time: 2,    value: [-1, 0, 0])
  ]
}
*/

/*
func generateBallRotations() -> [KeyQuaternion] {
  return [
    KeyQuaternion(time: 0,    value: simd_quatf(ix: 0, iy: 0, iz: 0, r: 1)),
    KeyQuaternion(time: 0.08, value: simd_quatf(angle: .pi/2, axis: [0, 0, -1])),
    KeyQuaternion(time: 0.17, value: simd_quatf(angle: .pi, axis: [0, 0, -1])),
    KeyQuaternion(time: 0.26, value: simd_quatf(angle: .pi + .pi/2, axis: [0, 0, -1])),
    KeyQuaternion(time: 0.35, value: simd_quatf(angle: 0, axis: [0, 0, -1])),
    KeyQuaternion(time: 1.0,  value: simd_quatf(angle: 0, axis: [0, 0, -1])),
    KeyQuaternion(time: 1.08, value: simd_quatf(angle: .pi + .pi/2, axis: [0, 0, -1])),
    KeyQuaternion(time: 1.17, value: simd_quatf(angle: .pi, axis: [0, 0, -1])),
    KeyQuaternion(time: 1.26, value: simd_quatf(angle: .pi/2, axis: [0, 0, -1])),
    KeyQuaternion(time: 1.35, value: simd_quatf(ix: 0, iy: 0, iz: 0, r: 1)),
    KeyQuaternion(time: 2,    value: simd_quatf(ix: 0, iy: 0, iz: 0, r: 1))
  ]
}
*/

