# This Python file uses the following encoding: utf-8
import sys
from PySide2.QtCore import QObject, Signal, Slot
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine as qmlengine

class TextInputInterface(QObject):
    signalNewText = Signal(str)
    
    def __init__(self):
        super().__init__()
    
    @Slot()
    def setText(self,someText):
        self.signalNewText.emit(someText)
        print("what did we get?")
    

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    
    engine = qmlengine()
    engine.quit.connect(app.quit)
    engine.load('main.qml')
    
    textInputInterface = TextInputInterface()
    
    engine.rootObjects()[0].setProperty('textInputInterface', textInputInterface)
    
    
    textInputInterface.setText(input("enter it: "))
    
    sys.exit(app.exec_())
    
    