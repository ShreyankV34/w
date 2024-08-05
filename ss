from PySide6.QtWidgets import QApplication, QMainWindow, QToolButton, QToolBar, QWidget
from PySide6.QtGui import QIcon
import qta

class BentoGUI(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Bento GUI")
        self.engines = []  # List to keep track of engines

        self.initUI()

    def initUI(self):
        self.formatbar = self.addToolBar("Format")
        self.home()

    def home(self):
        self.formatbar.addSeparator()

        # Add Engine button
        icon = qta.icon("mdi6.turbine", color=('green', 120))
        self.add_engine_button = QToolButton(self)
        self.add_engine_button.setToolTip("Add Engine")
        self.add_engine_button.setObjectName("btnAddEngine")
        self.add_engine_button.setIcon(icon)
        self.add_engine_button.clicked.connect(self.add_engine)
        self.formatbar.addWidget(self.add_engine_button)

        # Delete Engine button, initially disabled
        icon = qta.icon("mdi6.delete-sweep", color=('red', 120))
        self.delete_engine_button = QToolButton(self)
        self.delete_engine_button.setToolTip("Delete Engine")
        self.delete_engine_button.setObjectName("btnDelEngine")
        self.delete_engine_button.setIcon(icon)
        self.delete_engine_button.setEnabled(False)  # Initially disabled
        self.delete_engine_button.clicked.connect(self.delete_engine)
        self.formatbar.addWidget(self.delete_engine_button)

        self.formatbar.addSeparator()

        # Other buttons (example)
        icon = qta.icon("mdi6.airplane-clock", color=('purple', 120))
        toolButton = QToolButton(self)
        toolButton.setToolTip("Add Mission")
        toolButton.setObjectName("btnAddMission")
        toolButton.setIcon(icon)
        toolButton.clicked.connect(self.add_mission)
        self.formatbar.addWidget(toolButton)

        icon = qta.icon("mdi6.airplane-minus", color=('red', 120))
        toolButton = QToolButton(self)
        toolButton.setToolTip("Remove Mission")
        toolButton.setObjectName("btnRemoveMission")
        toolButton.setIcon(icon)
        self.formatbar.addWidget(toolButton)

        self.formatbar.addSeparator()

        # Additional setup based on your image
        # (Similar to the example provided, repeat for other buttons and their functionalities)

    def add_engine(self):
        # Add an engine to the list
        self.engines.append("Engine")
        self.update_ui()

    def delete_engine(self):
        # Remove an engine from the list
        if self.engines:
            self.engines.pop()
        self.update_ui()

    def update_ui(self):
        # Enable or disable delete button based on the presence of engines
        self.delete_engine_button.setEnabled(bool(self.engines))

    def add_mission(self):
        # Placeholder for the add mission functionality
        print("Add mission")

if __name__ == "__main__":
    app = QApplication([])

    window = BentoGUI()
    window.show()

    app.exec()
