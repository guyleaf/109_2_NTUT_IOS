import SwiftUI

struct ContentView: View {
    
    let photos = ["cat","dog","panda"]
    @State private var currentIndex: Int = 0
    @State private var classificationLabel1: String = "Click Classify"
    @State private var classificationLabel2: String = "Click Classify"

    let model1 = Lab11_imageClassification_1()
    let model2 = MobileNetV2FP16()

    private func imageClassification() {
        let currentImageName = photos[currentIndex]
        guard let img = UIImage(named: currentImageName),
        let resizedImage1 = img.resizeTo(size: CGSize(width: 299, height: 299)),
        let resizedImage2 = img.resizeTo(size: CGSize(width: 224, height: 224)),
        let buffer1 = resizedImage1.toBuffer(),
        let buffer2 = resizedImage2.toBuffer()
        else {
            return
        }

        let output1 = try? model1.prediction(image: buffer1)
        let output2 = try? model2.prediction(image: buffer2)
        if let output = output1 {
            let results = output.classLabelProbs.sorted {
                $0.value > $1.value
            }

            self.classificationLabel1 = "\(results.first!.key)=\(String(format: "%3f", results.first!.value))"
        }
        
        if let output = output2 {
            let results = output.classLabelProbs.sorted {
                $0.value > $1.value
            }

            self.classificationLabel2 = "\(results.first!.key)=\(String(format: "%3f", results.first!.value))"
        }
    }
    
    var body: some View {
        VStack {
            Image(photos[currentIndex])
            .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .shadow(radius: 10)
            HStack {
                Button("Previous"){
                    if self.currentIndex > 0 {
                        self.currentIndex = self.currentIndex - 1
                    }
                    else{
                        self.currentIndex = self.photos.count - 1
                    }
                    self.classificationLabel1 = "Click Classify"
                    self.classificationLabel2 = "Click Classify"
                    }.padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .frame(width: 100)
                
                Button("Next") {
                    if self.currentIndex < self.photos.count - 1 {
                        self.currentIndex = self.currentIndex + 1
                    }
                    else{
                        self.currentIndex = 0
                    }
                    self.classificationLabel1 = "Click Classify"
                    self.classificationLabel2 = "Click Classify"
                }.padding()
                .foregroundColor(Color.white)
                .frame(width: 100)
                .background(Color.gray)
                .cornerRadius(10)
            }.padding()
            
            Button("Classify") {
                // classify the image here
                self.imageClassification()
            }.padding()
            .foregroundColor(Color.white)
            .background(Color.green)
            .cornerRadius(8)
            
            HStack {
                VStack {
                    Text("My model:")
                        .font(.largeTitle)
                        .padding()
                    Text(classificationLabel1)
                        .padding()
                }
                Spacer()
                VStack {
                    Text("MobileNetV2FP16:")
                        .font(.largeTitle)
                        .padding()
                    Text(classificationLabel2)
                        .padding()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
