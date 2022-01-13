/********************************************************************************
** Form generated from reading UI file 'compactWithSkel.ui'
**
** Created by: Qt User Interface Compiler version 5.11.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef COMPACTUI_H
#define COMPACTUI_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QCheckBox>
#include <QtWidgets/QComboBox>
#include <QtWidgets/QDoubleSpinBox>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QGroupBox>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QRadioButton>
#include <QtWidgets/QSlider>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QSpinBox>
#include <QtWidgets/QSplitter>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTabWidget>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *openFile;
    QAction *saveView;
    QAction *loadView;
    QAction *readRadii;
    QAction *actionHelp;
    QWidget *centralwidget;
    QGridLayout *gridLayout_11;
    QSplitter *splitter;
    QTabWidget *toolTabs;
    QWidget *fileTab;
    QGridLayout *gridLayout_17;
    QGroupBox *loadFileGroup;
    QGridLayout *gridLayout_40;
    QLabel *label_11;
    QLineEdit *maFileEdit;
    QPushButton *browseMAFileBtn;
    QLabel *label_12;
    QLineEdit *shapeFileEdit;
    QPushButton *browse3DShapeFileBtn;
    QLabel *label_13;
    QLineEdit *radiusFileEdit;
    QPushButton *browseRadiusFileBtn;
    QPushButton *loadFilesBtn;
    QCheckBox *removeDupFace;
    QSpacerItem *verticalSpacer_3;
    QWidget *origSurfTab;
    QGroupBox *groupBox;
    QGridLayout *gridLayout_30;
    QPushButton *colorBGBtn;
    QCheckBox *drawEdge;
    QPushButton *saveViewBtn;
    QPushButton *loadViewBtn;
    QCheckBox *useTrueTransparencyBox;
    QSpinBox *DPMaxRendersSpin;
    QLabel *label_10;
    QDoubleSpinBox *MCWidthSpin;
    QGroupBox *origSurfViewGroup;
    QGridLayout *gridLayout_16;
    QCheckBox *hideOrig;
    QPushButton *colorOrigBtn;
    QLabel *label_4;
    QSlider *origTransparentSlider;
    QGroupBox *mcViewGroup;
    QGridLayout *gridLayout_4;
    QCheckBox *visBurnt;
    QPushButton *colorMCBtn;
    QCheckBox *hideMC;
    QGroupBox *groupBox_2;
    QGridLayout *gridLayout_8;
    QLabel *label_20;
    QComboBox *visMCDistCombo;
    QDoubleSpinBox *pruneMCDistSpin1;
    QGridLayout *gridLayout_39;
    QCheckBox *clampMCDistBox;
    QDoubleSpinBox *minVisDistMCSpin;
    QDoubleSpinBox *maxVisDistMCSpin;
    QComboBox *pruneMCDistCombo1;
    QSlider *pruneMCSlider1;
    QLabel *label_21;
    QSlider *MCAlphaSlider;
    QLabel *label_18;
    QSlider *MCTransExpSlider;
    QGroupBox *maViewGroup;
    QGridLayout *gridLayout_6;
    QCheckBox *hideMA;
    QCheckBox *turnOffLightingForMABox;
    QCheckBox *drawStPoints;
    QCheckBox *hideMALine;
    QPushButton *colorMABtn;
    QGroupBox *distVisBtnGroup;
    QGridLayout *gridLayout_22;
    QLabel *label_19;
    QComboBox *visMADistCombo;
    QSlider *pruneMASlider1;
    QDoubleSpinBox *pruneMASpin1;
    QGridLayout *gridLayout_38;
    QCheckBox *clampMADistBox;
    QDoubleSpinBox *minVisDistMASpin;
    QDoubleSpinBox *maxVisDistMASpin;
    QLabel *label_14;
    QSlider *MATransparentSlider;
    QSlider *MATransExpSlider;
    QGroupBox *hsViewGroup;
    QGridLayout *gridLayout_9;
    QCheckBox *hideHS;
    QGroupBox *groupBox_3;
    QGridLayout *gridLayout_2;
    QLabel *label_22;
    QComboBox *visSkelDistCombo;
    QCheckBox *clampMCDistBox_2;
    QDoubleSpinBox *minVisDistSkelSpin;
    QDoubleSpinBox *maxVisDistSkelSpin;
    QWidget *skelTab;
    QGridLayout *gridLayout_42;
    QGroupBox *precomputeGroup;
    QGridLayout *gridLayout_10;
    QLabel *label_15;
    QDoubleSpinBox *nFixedSteinerSpin;
    QPushButton *precomputeAllBtn;
    QGroupBox *createSkelGroup;
    QGridLayout *gridLayout_37;
    QLabel *label_17;
    QLabel *label_16;
    QSlider *hsBt2Bt3Slider;
    QSlider *hsBt1Bt2Slider;
    QDoubleSpinBox *hsFaceDiffSpin;
    QDoubleSpinBox *hsCurveDiffSpin;
    QCheckBox *smoothSkelCurve;
    QSpinBox *smoothSkelCurveSpin;
    QCheckBox *removeSmallCmpnts;
    QDoubleSpinBox *hsFaceDegenThreshold;
    QPushButton *createSkelBtn;
    QPushButton *exportHSBtn;
    QSpacerItem *verticalSpacer_9;
    QWidget *MATab;
    QGridLayout *gridLayout_12;
    QGroupBox *maBurnGroup;
    QGridLayout *gridLayout_5;
    QPushButton *burnBtn;
    QPushButton *cleanTopoBtn;
    QGroupBox *maMeasureGroup;
    QGridLayout *gridLayout_3;
    QComboBox *pruneMADistCombo1;
    QCheckBox *enableFinePruneMA;
    QGroupBox *exportBTGroup;
    QGridLayout *gridLayout_32;
    QPushButton *exportBTBtn;
    QCheckBox *exportPerSectorBTBox;
    QSpacerItem *verticalSpacer;
    QWidget *HSTab;
    QGridLayout *gridLayout_34;
    QSpacerItem *verticalSpacer_8;
    QGroupBox *hsCreateGroup;
    QGridLayout *gridLayout_33;
    QPushButton *createHSBtn;
    QGroupBox *mcPruneGroup;
    QGridLayout *gridLayout_15;
    QGroupBox *exportHSGroup;
    QGridLayout *gridLayout_35;
    QGroupBox *hsPruneGroup;
    QGridLayout *gridLayout_18;
    QPushButton *visHSBtn;
    QLabel *label_5;
    QLabel *label_7;
    QWidget *MCTab;
    QGridLayout *gridLayout_36;
    QSpacerItem *verticalSpacer_4;
    QGroupBox *mcDualizeGroup;
    QGridLayout *gridLayout_7;
    QPushButton *dualizeBtn;
    QGroupBox *mpGroup;
    QGridLayout *gridLayout_21;
    QCheckBox *showMPBox;
    QWidget *ExportTab;
    QGridLayout *gridLayout_29;
    QGroupBox *exportGroup;
    QGridLayout *gridLayout_13;
    QCheckBox *ExportSkelBox;
    QPushButton *exportBtn;
    QSpacerItem *verticalSpacer_7;
    QWidget *SMetricTab;
    QGridLayout *gridLayout_20;
    QGroupBox *surfFuncGroup;
    QGridLayout *gridLayout_19;
    QComboBox *pruneSMetricCombo;
    QPushButton *surfFuncProjectBtn;
    QComboBox *surfFuncCorrespSchemeCombo;
    QSlider *smoothSMetricSlider;
    QCheckBox *diffuseSurfFunc;
    QDoubleSpinBox *surfFuncRadiusEps;
    QPushButton *surfFuncSetupCorrespBtn;
    QSpinBox *surfFuncKNN;
    QSpacerItem *verticalSpacer_5;
    QWidget *VideoTab;
    QGridLayout *gridLayout_23;
    QGroupBox *isoSurfGroup;
    QGridLayout *gridLayout_24;
    QPushButton *isoSurfPrecomputeBtn;
    QCheckBox *hideIsoSurf;
    QCheckBox *recursiveRefineBox;
    QSlider *isoSurfSlider;
    QCheckBox *hideSnappedFaceBox;
    QPushButton *isoSurfRefineBtn;
    QGroupBox *groupBox_7;
    QGridLayout *gridLayout_25;
    QPushButton *isoContPrecomputeBtn;
    QCheckBox *hideIsoCont;
    QCheckBox *isoContShowMC;
    QCheckBox *hidePastSurfBox;
    QSlider *isoContSlider;
    QGroupBox *groupBox_9;
    QGridLayout *gridLayout_27;
    QSlider *isoContMinAlphaSlider;
    QSlider *isoContExpAlphaSlider;
    QSpacerItem *verticalSpacer_6;
    QGroupBox *groupBox_8;
    QGridLayout *gridLayout_26;
    QSlider *evolveAllSlider;
    QPushButton *evolveAllPrecomputeBtn;
    QCheckBox *evolveAllShowEntireMC;
    QWidget *MiscTab;
    QGridLayout *gridLayout_31;
    QSpacerItem *verticalSpacer_2;
    QGroupBox *preprocessGroup;
    QGridLayout *gridLayout;
    QLabel *label_2;
    QDoubleSpinBox *pertSpin;
    QLabel *label;
    QDoubleSpinBox *epsilonSpin;
    QGroupBox *miscBurntimeGroup;
    QGridLayout *gridLayout_28;
    QPushButton *visSphereFromFileBtn;
    QSpinBox *visSphereSpin;
    QPushButton *randBTBtn;
    QPushButton *printBTBtn;
    QSlider *visSphereSlider;
    QCheckBox *showSphereBox;
    QPushButton *printSelectVertInfoBtn;
    QGroupBox *renderParamGroup;
    QFormLayout *formLayout_3;
    QLabel *label_3;
    QSlider *linesRenderOffsetSlider;
    QGroupBox *qmatGroup;
    QFormLayout *formLayout_4;
    QLabel *label_9;
    QPushButton *outputWenpingBtn;
    QPushButton *readQMatMA;
    QCheckBox *hideQMatBox;
    QWidget *hiddenTab;
    QComboBox *stSubdivCombo;
    QComboBox *edgeWeightCombo;
    QDoubleSpinBox *pointSizeSpin;
    QCheckBox *doMAFaceScalarDiffusion;
    QPushButton *computeAllDistBtn;
    QCheckBox *usePerSheetBox;
    QDoubleSpinBox *maxPruneDistMASpin2;
    QDoubleSpinBox *maPruneRatio;
    QDoubleSpinBox *minPruneDistMASpin1;
    QDoubleSpinBox *pruneMASpin2;
    QDoubleSpinBox *maxPruneDistMASpin1;
    QSlider *pruneMASlider2;
    QComboBox *pruneMADistCombo2;
    QDoubleSpinBox *minPruneDistMASpin2;
    QComboBox *edgeDualOptCombo;
    QComboBox *polyDualOptCombo;
    QCheckBox *underEstimateBox;
    QCheckBox *onlyUnburntBox;
    QCheckBox *stopAtJuncBox;
    QCheckBox *protectBT2Box;
    QSlider *hsBt1Bt2RelSlider;
    QDoubleSpinBox *hsCurveRelDiffSpin;
    QDoubleSpinBox *hsFaceRelDiffSpin;
    QSlider *hsBt2Bt3RelSlider;
    QLabel *label_8;
    QLabel *label_6;
    QDoubleSpinBox *hsCmpntFaceNumTSpin;
    QGroupBox *mcBurnGroup;
    QGridLayout *gridLayout_14;
    QPushButton *burnMedialCurveBtn;
    QPushButton *printMCStatsBtn;
    QSlider *pruneMCSlider2;
    QDoubleSpinBox *mcPruneRatio;
    QComboBox *pruneMCDistCombo2;
    QDoubleSpinBox *pruneMCDistSpin2;
    QRadioButton *colorPerVert;
    QRadioButton *colorPerFace;
    QCheckBox *hsUseTypedInput;
    QCheckBox *visBallStick;
    QCheckBox *preserveMCTopo;
    QWidget *layoutWidget;
    QHBoxLayout *glLayout;
    QSpacerItem *horizontalSpacer;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(1258, 1022);
        QSizePolicy sizePolicy(QSizePolicy::Minimum, QSizePolicy::Minimum);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(MainWindow->sizePolicy().hasHeightForWidth());
        MainWindow->setSizePolicy(sizePolicy);
        MainWindow->setMinimumSize(QSize(800, 600));
        openFile = new QAction(MainWindow);
        openFile->setObjectName(QStringLiteral("openFile"));
        saveView = new QAction(MainWindow);
        saveView->setObjectName(QStringLiteral("saveView"));
        loadView = new QAction(MainWindow);
        loadView->setObjectName(QStringLiteral("loadView"));
        readRadii = new QAction(MainWindow);
        readRadii->setObjectName(QStringLiteral("readRadii"));
        actionHelp = new QAction(MainWindow);
        actionHelp->setObjectName(QStringLiteral("actionHelp"));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QStringLiteral("centralwidget"));
        gridLayout_11 = new QGridLayout(centralwidget);
        gridLayout_11->setObjectName(QStringLiteral("gridLayout_11"));
        splitter = new QSplitter(centralwidget);
        splitter->setObjectName(QStringLiteral("splitter"));
        splitter->setOrientation(Qt::Horizontal);
        toolTabs = new QTabWidget(splitter);
        toolTabs->setObjectName(QStringLiteral("toolTabs"));
        toolTabs->setEnabled(true);
        sizePolicy.setHeightForWidth(toolTabs->sizePolicy().hasHeightForWidth());
        toolTabs->setSizePolicy(sizePolicy);
        toolTabs->setMaximumSize(QSize(280, 16777215));
        fileTab = new QWidget();
        fileTab->setObjectName(QStringLiteral("fileTab"));
        gridLayout_17 = new QGridLayout(fileTab);
        gridLayout_17->setObjectName(QStringLiteral("gridLayout_17"));
        loadFileGroup = new QGroupBox(fileTab);
        loadFileGroup->setObjectName(QStringLiteral("loadFileGroup"));
        sizePolicy.setHeightForWidth(loadFileGroup->sizePolicy().hasHeightForWidth());
        loadFileGroup->setSizePolicy(sizePolicy);
        gridLayout_40 = new QGridLayout(loadFileGroup);
        gridLayout_40->setObjectName(QStringLiteral("gridLayout_40"));
        label_11 = new QLabel(loadFileGroup);
        label_11->setObjectName(QStringLiteral("label_11"));

        gridLayout_40->addWidget(label_11, 0, 0, 1, 1);

        maFileEdit = new QLineEdit(loadFileGroup);
        maFileEdit->setObjectName(QStringLiteral("maFileEdit"));

        gridLayout_40->addWidget(maFileEdit, 0, 1, 1, 1);

        browseMAFileBtn = new QPushButton(loadFileGroup);
        browseMAFileBtn->setObjectName(QStringLiteral("browseMAFileBtn"));

        gridLayout_40->addWidget(browseMAFileBtn, 0, 2, 1, 1);

        label_12 = new QLabel(loadFileGroup);
        label_12->setObjectName(QStringLiteral("label_12"));

        gridLayout_40->addWidget(label_12, 1, 0, 1, 1);

        shapeFileEdit = new QLineEdit(loadFileGroup);
        shapeFileEdit->setObjectName(QStringLiteral("shapeFileEdit"));

        gridLayout_40->addWidget(shapeFileEdit, 1, 1, 1, 1);

        browse3DShapeFileBtn = new QPushButton(loadFileGroup);
        browse3DShapeFileBtn->setObjectName(QStringLiteral("browse3DShapeFileBtn"));

        gridLayout_40->addWidget(browse3DShapeFileBtn, 1, 2, 1, 1);

        label_13 = new QLabel(loadFileGroup);
        label_13->setObjectName(QStringLiteral("label_13"));

        gridLayout_40->addWidget(label_13, 2, 0, 1, 1);

        radiusFileEdit = new QLineEdit(loadFileGroup);
        radiusFileEdit->setObjectName(QStringLiteral("radiusFileEdit"));

        gridLayout_40->addWidget(radiusFileEdit, 2, 1, 1, 1);

        browseRadiusFileBtn = new QPushButton(loadFileGroup);
        browseRadiusFileBtn->setObjectName(QStringLiteral("browseRadiusFileBtn"));

        gridLayout_40->addWidget(browseRadiusFileBtn, 2, 2, 1, 1);

        loadFilesBtn = new QPushButton(loadFileGroup);
        loadFilesBtn->setObjectName(QStringLiteral("loadFilesBtn"));

        gridLayout_40->addWidget(loadFilesBtn, 3, 2, 1, 1);

        removeDupFace = new QCheckBox(loadFileGroup);
        removeDupFace->setObjectName(QStringLiteral("removeDupFace"));

        gridLayout_40->addWidget(removeDupFace, 3, 1, 1, 1);


        gridLayout_17->addWidget(loadFileGroup, 0, 0, 1, 1);

        verticalSpacer_3 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_17->addItem(verticalSpacer_3, 1, 0, 1, 1);

        toolTabs->addTab(fileTab, QString());
        origSurfTab = new QWidget();
        origSurfTab->setObjectName(QStringLiteral("origSurfTab"));
        groupBox = new QGroupBox(origSurfTab);
        groupBox->setObjectName(QStringLiteral("groupBox"));
        groupBox->setGeometry(QRect(9, 9, 256, 211));
        gridLayout_30 = new QGridLayout(groupBox);
        gridLayout_30->setObjectName(QStringLiteral("gridLayout_30"));
        colorBGBtn = new QPushButton(groupBox);
        colorBGBtn->setObjectName(QStringLiteral("colorBGBtn"));
        QSizePolicy sizePolicy1(QSizePolicy::MinimumExpanding, QSizePolicy::Fixed);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(colorBGBtn->sizePolicy().hasHeightForWidth());
        colorBGBtn->setSizePolicy(sizePolicy1);

        gridLayout_30->addWidget(colorBGBtn, 0, 0, 1, 1);

        drawEdge = new QCheckBox(groupBox);
        drawEdge->setObjectName(QStringLiteral("drawEdge"));
        QSizePolicy sizePolicy2(QSizePolicy::Expanding, QSizePolicy::Fixed);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(drawEdge->sizePolicy().hasHeightForWidth());
        drawEdge->setSizePolicy(sizePolicy2);

        gridLayout_30->addWidget(drawEdge, 0, 1, 1, 1);

        saveViewBtn = new QPushButton(groupBox);
        saveViewBtn->setObjectName(QStringLiteral("saveViewBtn"));
        sizePolicy1.setHeightForWidth(saveViewBtn->sizePolicy().hasHeightForWidth());
        saveViewBtn->setSizePolicy(sizePolicy1);

        gridLayout_30->addWidget(saveViewBtn, 1, 0, 1, 1);

        loadViewBtn = new QPushButton(groupBox);
        loadViewBtn->setObjectName(QStringLiteral("loadViewBtn"));
        sizePolicy2.setHeightForWidth(loadViewBtn->sizePolicy().hasHeightForWidth());
        loadViewBtn->setSizePolicy(sizePolicy2);

        gridLayout_30->addWidget(loadViewBtn, 1, 1, 1, 1);

        useTrueTransparencyBox = new QCheckBox(groupBox);
        useTrueTransparencyBox->setObjectName(QStringLiteral("useTrueTransparencyBox"));
        sizePolicy1.setHeightForWidth(useTrueTransparencyBox->sizePolicy().hasHeightForWidth());
        useTrueTransparencyBox->setSizePolicy(sizePolicy1);

        gridLayout_30->addWidget(useTrueTransparencyBox, 2, 0, 1, 1);

        DPMaxRendersSpin = new QSpinBox(groupBox);
        DPMaxRendersSpin->setObjectName(QStringLiteral("DPMaxRendersSpin"));
        sizePolicy2.setHeightForWidth(DPMaxRendersSpin->sizePolicy().hasHeightForWidth());
        DPMaxRendersSpin->setSizePolicy(sizePolicy2);
        DPMaxRendersSpin->setMaximum(99999);

        gridLayout_30->addWidget(DPMaxRendersSpin, 2, 1, 1, 1);

        label_10 = new QLabel(groupBox);
        label_10->setObjectName(QStringLiteral("label_10"));
        QSizePolicy sizePolicy3(QSizePolicy::MinimumExpanding, QSizePolicy::Preferred);
        sizePolicy3.setHorizontalStretch(0);
        sizePolicy3.setVerticalStretch(0);
        sizePolicy3.setHeightForWidth(label_10->sizePolicy().hasHeightForWidth());
        label_10->setSizePolicy(sizePolicy3);

        gridLayout_30->addWidget(label_10, 3, 0, 1, 1);

        MCWidthSpin = new QDoubleSpinBox(groupBox);
        MCWidthSpin->setObjectName(QStringLiteral("MCWidthSpin"));
        sizePolicy2.setHeightForWidth(MCWidthSpin->sizePolicy().hasHeightForWidth());
        MCWidthSpin->setSizePolicy(sizePolicy2);

        gridLayout_30->addWidget(MCWidthSpin, 3, 1, 1, 1);

        origSurfViewGroup = new QGroupBox(groupBox);
        origSurfViewGroup->setObjectName(QStringLiteral("origSurfViewGroup"));
        QSizePolicy sizePolicy4(QSizePolicy::Preferred, QSizePolicy::Preferred);
        sizePolicy4.setHorizontalStretch(0);
        sizePolicy4.setVerticalStretch(0);
        sizePolicy4.setHeightForWidth(origSurfViewGroup->sizePolicy().hasHeightForWidth());
        origSurfViewGroup->setSizePolicy(sizePolicy4);
        origSurfViewGroup->setMinimumSize(QSize(250, 0));
        origSurfViewGroup->setMaximumSize(QSize(200, 16777215));
        gridLayout_16 = new QGridLayout(origSurfViewGroup);
        gridLayout_16->setObjectName(QStringLiteral("gridLayout_16"));
        hideOrig = new QCheckBox(origSurfViewGroup);
        hideOrig->setObjectName(QStringLiteral("hideOrig"));
        sizePolicy2.setHeightForWidth(hideOrig->sizePolicy().hasHeightForWidth());
        hideOrig->setSizePolicy(sizePolicy2);

        gridLayout_16->addWidget(hideOrig, 2, 0, 1, 1);

        colorOrigBtn = new QPushButton(origSurfViewGroup);
        colorOrigBtn->setObjectName(QStringLiteral("colorOrigBtn"));
        sizePolicy2.setHeightForWidth(colorOrigBtn->sizePolicy().hasHeightForWidth());
        colorOrigBtn->setSizePolicy(sizePolicy2);
        colorOrigBtn->setMaximumSize(QSize(500, 23));

        gridLayout_16->addWidget(colorOrigBtn, 2, 1, 1, 1);

        label_4 = new QLabel(origSurfViewGroup);
        label_4->setObjectName(QStringLiteral("label_4"));
        label_4->setAlignment(Qt::AlignCenter);

        gridLayout_16->addWidget(label_4, 3, 0, 1, 1);

        origTransparentSlider = new QSlider(origSurfViewGroup);
        origTransparentSlider->setObjectName(QStringLiteral("origTransparentSlider"));
        origTransparentSlider->setOrientation(Qt::Horizontal);

        gridLayout_16->addWidget(origTransparentSlider, 3, 1, 1, 1);


        gridLayout_30->addWidget(origSurfViewGroup, 4, 0, 1, 2);

        mcViewGroup = new QGroupBox(origSurfTab);
        mcViewGroup->setObjectName(QStringLiteral("mcViewGroup"));
        mcViewGroup->setGeometry(QRect(9, 484, 251, 255));
        gridLayout_4 = new QGridLayout(mcViewGroup);
        gridLayout_4->setObjectName(QStringLiteral("gridLayout_4"));
        visBurnt = new QCheckBox(mcViewGroup);
        visBurnt->setObjectName(QStringLiteral("visBurnt"));
        QSizePolicy sizePolicy5(QSizePolicy::Minimum, QSizePolicy::Fixed);
        sizePolicy5.setHorizontalStretch(0);
        sizePolicy5.setVerticalStretch(0);
        sizePolicy5.setHeightForWidth(visBurnt->sizePolicy().hasHeightForWidth());
        visBurnt->setSizePolicy(sizePolicy5);

        gridLayout_4->addWidget(visBurnt, 0, 0, 1, 1);

        colorMCBtn = new QPushButton(mcViewGroup);
        colorMCBtn->setObjectName(QStringLiteral("colorMCBtn"));
        sizePolicy2.setHeightForWidth(colorMCBtn->sizePolicy().hasHeightForWidth());
        colorMCBtn->setSizePolicy(sizePolicy2);

        gridLayout_4->addWidget(colorMCBtn, 0, 1, 1, 1);

        hideMC = new QCheckBox(mcViewGroup);
        hideMC->setObjectName(QStringLiteral("hideMC"));
        sizePolicy5.setHeightForWidth(hideMC->sizePolicy().hasHeightForWidth());
        hideMC->setSizePolicy(sizePolicy5);

        gridLayout_4->addWidget(hideMC, 1, 0, 1, 1);

        groupBox_2 = new QGroupBox(mcViewGroup);
        groupBox_2->setObjectName(QStringLiteral("groupBox_2"));
        gridLayout_8 = new QGridLayout(groupBox_2);
        gridLayout_8->setObjectName(QStringLiteral("gridLayout_8"));
        label_20 = new QLabel(groupBox_2);
        label_20->setObjectName(QStringLiteral("label_20"));

        gridLayout_8->addWidget(label_20, 0, 0, 1, 1);

        visMCDistCombo = new QComboBox(groupBox_2);
        visMCDistCombo->setObjectName(QStringLiteral("visMCDistCombo"));
        sizePolicy2.setHeightForWidth(visMCDistCombo->sizePolicy().hasHeightForWidth());
        visMCDistCombo->setSizePolicy(sizePolicy2);

        gridLayout_8->addWidget(visMCDistCombo, 0, 2, 1, 1);

        pruneMCDistSpin1 = new QDoubleSpinBox(groupBox_2);
        pruneMCDistSpin1->setObjectName(QStringLiteral("pruneMCDistSpin1"));
        sizePolicy2.setHeightForWidth(pruneMCDistSpin1->sizePolicy().hasHeightForWidth());
        pruneMCDistSpin1->setSizePolicy(sizePolicy2);
        pruneMCDistSpin1->setDecimals(5);
        pruneMCDistSpin1->setMaximum(1e+9);

        gridLayout_8->addWidget(pruneMCDistSpin1, 2, 2, 1, 2);

        gridLayout_39 = new QGridLayout();
        gridLayout_39->setObjectName(QStringLiteral("gridLayout_39"));
        clampMCDistBox = new QCheckBox(groupBox_2);
        clampMCDistBox->setObjectName(QStringLiteral("clampMCDistBox"));

        gridLayout_39->addWidget(clampMCDistBox, 0, 0, 1, 1);

        minVisDistMCSpin = new QDoubleSpinBox(groupBox_2);
        minVisDistMCSpin->setObjectName(QStringLiteral("minVisDistMCSpin"));
        sizePolicy2.setHeightForWidth(minVisDistMCSpin->sizePolicy().hasHeightForWidth());
        minVisDistMCSpin->setSizePolicy(sizePolicy2);
        minVisDistMCSpin->setDecimals(5);

        gridLayout_39->addWidget(minVisDistMCSpin, 0, 1, 1, 1);

        maxVisDistMCSpin = new QDoubleSpinBox(groupBox_2);
        maxVisDistMCSpin->setObjectName(QStringLiteral("maxVisDistMCSpin"));
        sizePolicy2.setHeightForWidth(maxVisDistMCSpin->sizePolicy().hasHeightForWidth());
        maxVisDistMCSpin->setSizePolicy(sizePolicy2);
        maxVisDistMCSpin->setDecimals(5);
        maxVisDistMCSpin->setMinimum(1e-5);
        maxVisDistMCSpin->setMaximum(1e+9);

        gridLayout_39->addWidget(maxVisDistMCSpin, 0, 2, 1, 1);


        gridLayout_8->addLayout(gridLayout_39, 3, 0, 1, 4);

        pruneMCDistCombo1 = new QComboBox(groupBox_2);
        pruneMCDistCombo1->setObjectName(QStringLiteral("pruneMCDistCombo1"));
        sizePolicy2.setHeightForWidth(pruneMCDistCombo1->sizePolicy().hasHeightForWidth());
        pruneMCDistCombo1->setSizePolicy(sizePolicy2);
        pruneMCDistCombo1->setMinimumSize(QSize(0, 0));

        gridLayout_8->addWidget(pruneMCDistCombo1, 1, 2, 1, 1);

        pruneMCSlider1 = new QSlider(groupBox_2);
        pruneMCSlider1->setObjectName(QStringLiteral("pruneMCSlider1"));
        sizePolicy2.setHeightForWidth(pruneMCSlider1->sizePolicy().hasHeightForWidth());
        pruneMCSlider1->setSizePolicy(sizePolicy2);
        pruneMCSlider1->setOrientation(Qt::Horizontal);

        gridLayout_8->addWidget(pruneMCSlider1, 2, 0, 1, 1);

        label_21 = new QLabel(groupBox_2);
        label_21->setObjectName(QStringLiteral("label_21"));
        label_21->setTextFormat(Qt::PlainText);

        gridLayout_8->addWidget(label_21, 1, 0, 1, 1);


        gridLayout_4->addWidget(groupBox_2, 2, 0, 1, 2);

        MCAlphaSlider = new QSlider(mcViewGroup);
        MCAlphaSlider->setObjectName(QStringLiteral("MCAlphaSlider"));
        MCAlphaSlider->setMaximum(1000);
        MCAlphaSlider->setOrientation(Qt::Horizontal);

        gridLayout_4->addWidget(MCAlphaSlider, 3, 1, 1, 1);

        label_18 = new QLabel(mcViewGroup);
        label_18->setObjectName(QStringLiteral("label_18"));

        gridLayout_4->addWidget(label_18, 3, 0, 1, 1);

        MCTransExpSlider = new QSlider(mcViewGroup);
        MCTransExpSlider->setObjectName(QStringLiteral("MCTransExpSlider"));
        MCTransExpSlider->setValue(2);
        MCTransExpSlider->setOrientation(Qt::Horizontal);

        gridLayout_4->addWidget(MCTransExpSlider, 4, 1, 1, 1);

        maViewGroup = new QGroupBox(origSurfTab);
        maViewGroup->setObjectName(QStringLiteral("maViewGroup"));
        maViewGroup->setGeometry(QRect(9, 226, 250, 252));
        maViewGroup->setMinimumSize(QSize(250, 0));
        maViewGroup->setMaximumSize(QSize(200, 16777215));
        gridLayout_6 = new QGridLayout(maViewGroup);
        gridLayout_6->setObjectName(QStringLiteral("gridLayout_6"));
        hideMA = new QCheckBox(maViewGroup);
        hideMA->setObjectName(QStringLiteral("hideMA"));
        QSizePolicy sizePolicy6(QSizePolicy::Preferred, QSizePolicy::Fixed);
        sizePolicy6.setHorizontalStretch(0);
        sizePolicy6.setVerticalStretch(0);
        sizePolicy6.setHeightForWidth(hideMA->sizePolicy().hasHeightForWidth());
        hideMA->setSizePolicy(sizePolicy6);

        gridLayout_6->addWidget(hideMA, 0, 0, 1, 1);

        turnOffLightingForMABox = new QCheckBox(maViewGroup);
        turnOffLightingForMABox->setObjectName(QStringLiteral("turnOffLightingForMABox"));
        sizePolicy6.setHeightForWidth(turnOffLightingForMABox->sizePolicy().hasHeightForWidth());
        turnOffLightingForMABox->setSizePolicy(sizePolicy6);

        gridLayout_6->addWidget(turnOffLightingForMABox, 0, 1, 1, 1);

        drawStPoints = new QCheckBox(maViewGroup);
        drawStPoints->setObjectName(QStringLiteral("drawStPoints"));
        sizePolicy6.setHeightForWidth(drawStPoints->sizePolicy().hasHeightForWidth());
        drawStPoints->setSizePolicy(sizePolicy6);

        gridLayout_6->addWidget(drawStPoints, 1, 0, 1, 1);

        hideMALine = new QCheckBox(maViewGroup);
        hideMALine->setObjectName(QStringLiteral("hideMALine"));
        sizePolicy6.setHeightForWidth(hideMALine->sizePolicy().hasHeightForWidth());
        hideMALine->setSizePolicy(sizePolicy6);

        gridLayout_6->addWidget(hideMALine, 1, 1, 1, 1);

        colorMABtn = new QPushButton(maViewGroup);
        colorMABtn->setObjectName(QStringLiteral("colorMABtn"));
        sizePolicy6.setHeightForWidth(colorMABtn->sizePolicy().hasHeightForWidth());
        colorMABtn->setSizePolicy(sizePolicy6);
        colorMABtn->setMaximumSize(QSize(500, 23));

        gridLayout_6->addWidget(colorMABtn, 2, 1, 1, 1);

        distVisBtnGroup = new QGroupBox(maViewGroup);
        distVisBtnGroup->setObjectName(QStringLiteral("distVisBtnGroup"));
        QSizePolicy sizePolicy7(QSizePolicy::Preferred, QSizePolicy::Minimum);
        sizePolicy7.setHorizontalStretch(0);
        sizePolicy7.setVerticalStretch(0);
        sizePolicy7.setHeightForWidth(distVisBtnGroup->sizePolicy().hasHeightForWidth());
        distVisBtnGroup->setSizePolicy(sizePolicy7);
        gridLayout_22 = new QGridLayout(distVisBtnGroup);
        gridLayout_22->setObjectName(QStringLiteral("gridLayout_22"));
        label_19 = new QLabel(distVisBtnGroup);
        label_19->setObjectName(QStringLiteral("label_19"));

        gridLayout_22->addWidget(label_19, 0, 0, 1, 1);

        visMADistCombo = new QComboBox(distVisBtnGroup);
        visMADistCombo->setObjectName(QStringLiteral("visMADistCombo"));
        sizePolicy6.setHeightForWidth(visMADistCombo->sizePolicy().hasHeightForWidth());
        visMADistCombo->setSizePolicy(sizePolicy6);

        gridLayout_22->addWidget(visMADistCombo, 0, 1, 1, 1);

        pruneMASlider1 = new QSlider(distVisBtnGroup);
        pruneMASlider1->setObjectName(QStringLiteral("pruneMASlider1"));
        sizePolicy6.setHeightForWidth(pruneMASlider1->sizePolicy().hasHeightForWidth());
        pruneMASlider1->setSizePolicy(sizePolicy6);
        pruneMASlider1->setMaximumSize(QSize(100, 16777215));
        pruneMASlider1->setMaximum(1000000);
        pruneMASlider1->setOrientation(Qt::Horizontal);

        gridLayout_22->addWidget(pruneMASlider1, 1, 0, 1, 1);

        pruneMASpin1 = new QDoubleSpinBox(distVisBtnGroup);
        pruneMASpin1->setObjectName(QStringLiteral("pruneMASpin1"));
        sizePolicy6.setHeightForWidth(pruneMASpin1->sizePolicy().hasHeightForWidth());
        pruneMASpin1->setSizePolicy(sizePolicy6);
        pruneMASpin1->setMaximumSize(QSize(100, 16777215));
        pruneMASpin1->setDecimals(5);
        pruneMASpin1->setMaximum(99999);

        gridLayout_22->addWidget(pruneMASpin1, 1, 1, 1, 1);

        gridLayout_38 = new QGridLayout();
        gridLayout_38->setObjectName(QStringLiteral("gridLayout_38"));
        clampMADistBox = new QCheckBox(distVisBtnGroup);
        clampMADistBox->setObjectName(QStringLiteral("clampMADistBox"));
        sizePolicy2.setHeightForWidth(clampMADistBox->sizePolicy().hasHeightForWidth());
        clampMADistBox->setSizePolicy(sizePolicy2);
        clampMADistBox->setMaximumSize(QSize(100, 16777215));

        gridLayout_38->addWidget(clampMADistBox, 0, 0, 1, 1);

        minVisDistMASpin = new QDoubleSpinBox(distVisBtnGroup);
        minVisDistMASpin->setObjectName(QStringLiteral("minVisDistMASpin"));
        sizePolicy2.setHeightForWidth(minVisDistMASpin->sizePolicy().hasHeightForWidth());
        minVisDistMASpin->setSizePolicy(sizePolicy2);
        minVisDistMASpin->setDecimals(5);

        gridLayout_38->addWidget(minVisDistMASpin, 0, 1, 1, 1);

        maxVisDistMASpin = new QDoubleSpinBox(distVisBtnGroup);
        maxVisDistMASpin->setObjectName(QStringLiteral("maxVisDistMASpin"));
        sizePolicy2.setHeightForWidth(maxVisDistMASpin->sizePolicy().hasHeightForWidth());
        maxVisDistMASpin->setSizePolicy(sizePolicy2);
        maxVisDistMASpin->setMaximumSize(QSize(500, 16777215));
        maxVisDistMASpin->setDecimals(5);
        maxVisDistMASpin->setMinimum(1e-5);
        maxVisDistMASpin->setMaximum(1e+7);

        gridLayout_38->addWidget(maxVisDistMASpin, 0, 2, 1, 1);


        gridLayout_22->addLayout(gridLayout_38, 2, 0, 1, 2);


        gridLayout_6->addWidget(distVisBtnGroup, 3, 0, 1, 2);

        label_14 = new QLabel(maViewGroup);
        label_14->setObjectName(QStringLiteral("label_14"));

        gridLayout_6->addWidget(label_14, 4, 0, 1, 1);

        MATransparentSlider = new QSlider(maViewGroup);
        MATransparentSlider->setObjectName(QStringLiteral("MATransparentSlider"));
        MATransparentSlider->setMaximum(1000);
        MATransparentSlider->setOrientation(Qt::Horizontal);

        gridLayout_6->addWidget(MATransparentSlider, 4, 1, 1, 1);

        MATransExpSlider = new QSlider(maViewGroup);
        MATransExpSlider->setObjectName(QStringLiteral("MATransExpSlider"));
        sizePolicy6.setHeightForWidth(MATransExpSlider->sizePolicy().hasHeightForWidth());
        MATransExpSlider->setSizePolicy(sizePolicy6);
        MATransExpSlider->setValue(2);
        MATransExpSlider->setOrientation(Qt::Horizontal);

        gridLayout_6->addWidget(MATransExpSlider, 5, 1, 1, 1);

        hsViewGroup = new QGroupBox(origSurfTab);
        hsViewGroup->setObjectName(QStringLiteral("hsViewGroup"));
        hsViewGroup->setGeometry(QRect(9, 745, 249, 141));
        QSizePolicy sizePolicy8(QSizePolicy::Minimum, QSizePolicy::Preferred);
        sizePolicy8.setHorizontalStretch(0);
        sizePolicy8.setVerticalStretch(0);
        sizePolicy8.setHeightForWidth(hsViewGroup->sizePolicy().hasHeightForWidth());
        hsViewGroup->setSizePolicy(sizePolicy8);
        gridLayout_9 = new QGridLayout(hsViewGroup);
        gridLayout_9->setObjectName(QStringLiteral("gridLayout_9"));
        hideHS = new QCheckBox(hsViewGroup);
        hideHS->setObjectName(QStringLiteral("hideHS"));

        gridLayout_9->addWidget(hideHS, 0, 0, 1, 1);

        groupBox_3 = new QGroupBox(hsViewGroup);
        groupBox_3->setObjectName(QStringLiteral("groupBox_3"));
        gridLayout_2 = new QGridLayout(groupBox_3);
        gridLayout_2->setObjectName(QStringLiteral("gridLayout_2"));
        label_22 = new QLabel(groupBox_3);
        label_22->setObjectName(QStringLiteral("label_22"));

        gridLayout_2->addWidget(label_22, 0, 0, 1, 2);

        visSkelDistCombo = new QComboBox(groupBox_3);
        visSkelDistCombo->setObjectName(QStringLiteral("visSkelDistCombo"));
        sizePolicy2.setHeightForWidth(visSkelDistCombo->sizePolicy().hasHeightForWidth());
        visSkelDistCombo->setSizePolicy(sizePolicy2);

        gridLayout_2->addWidget(visSkelDistCombo, 0, 2, 1, 1);

        clampMCDistBox_2 = new QCheckBox(groupBox_3);
        clampMCDistBox_2->setObjectName(QStringLiteral("clampMCDistBox_2"));

        gridLayout_2->addWidget(clampMCDistBox_2, 1, 0, 1, 1);

        minVisDistSkelSpin = new QDoubleSpinBox(groupBox_3);
        minVisDistSkelSpin->setObjectName(QStringLiteral("minVisDistSkelSpin"));
        sizePolicy2.setHeightForWidth(minVisDistSkelSpin->sizePolicy().hasHeightForWidth());
        minVisDistSkelSpin->setSizePolicy(sizePolicy2);
        minVisDistSkelSpin->setDecimals(5);

        gridLayout_2->addWidget(minVisDistSkelSpin, 1, 1, 1, 1);

        maxVisDistSkelSpin = new QDoubleSpinBox(groupBox_3);
        maxVisDistSkelSpin->setObjectName(QStringLiteral("maxVisDistSkelSpin"));
        sizePolicy2.setHeightForWidth(maxVisDistSkelSpin->sizePolicy().hasHeightForWidth());
        maxVisDistSkelSpin->setSizePolicy(sizePolicy2);
        maxVisDistSkelSpin->setDecimals(5);
        maxVisDistSkelSpin->setMinimum(1e-5);
        maxVisDistSkelSpin->setMaximum(1e+9);

        gridLayout_2->addWidget(maxVisDistSkelSpin, 1, 2, 1, 1);


        gridLayout_9->addWidget(groupBox_3, 1, 0, 1, 1);

        toolTabs->addTab(origSurfTab, QString());
        skelTab = new QWidget();
        skelTab->setObjectName(QStringLiteral("skelTab"));
        gridLayout_42 = new QGridLayout(skelTab);
        gridLayout_42->setObjectName(QStringLiteral("gridLayout_42"));
        precomputeGroup = new QGroupBox(skelTab);
        precomputeGroup->setObjectName(QStringLiteral("precomputeGroup"));
        sizePolicy4.setHeightForWidth(precomputeGroup->sizePolicy().hasHeightForWidth());
        precomputeGroup->setSizePolicy(sizePolicy4);
        gridLayout_10 = new QGridLayout(precomputeGroup);
        gridLayout_10->setObjectName(QStringLiteral("gridLayout_10"));
        label_15 = new QLabel(precomputeGroup);
        label_15->setObjectName(QStringLiteral("label_15"));

        gridLayout_10->addWidget(label_15, 0, 0, 1, 1);

        nFixedSteinerSpin = new QDoubleSpinBox(precomputeGroup);
        nFixedSteinerSpin->setObjectName(QStringLiteral("nFixedSteinerSpin"));
        sizePolicy5.setHeightForWidth(nFixedSteinerSpin->sizePolicy().hasHeightForWidth());
        nFixedSteinerSpin->setSizePolicy(sizePolicy5);
        nFixedSteinerSpin->setDecimals(5);

        gridLayout_10->addWidget(nFixedSteinerSpin, 0, 1, 1, 1);

        precomputeAllBtn = new QPushButton(precomputeGroup);
        precomputeAllBtn->setObjectName(QStringLiteral("precomputeAllBtn"));

        gridLayout_10->addWidget(precomputeAllBtn, 1, 1, 1, 1);


        gridLayout_42->addWidget(precomputeGroup, 0, 0, 1, 1);

        createSkelGroup = new QGroupBox(skelTab);
        createSkelGroup->setObjectName(QStringLiteral("createSkelGroup"));
        sizePolicy4.setHeightForWidth(createSkelGroup->sizePolicy().hasHeightForWidth());
        createSkelGroup->setSizePolicy(sizePolicy4);
        gridLayout_37 = new QGridLayout(createSkelGroup);
        gridLayout_37->setObjectName(QStringLiteral("gridLayout_37"));
        label_17 = new QLabel(createSkelGroup);
        label_17->setObjectName(QStringLiteral("label_17"));
        sizePolicy8.setHeightForWidth(label_17->sizePolicy().hasHeightForWidth());
        label_17->setSizePolicy(sizePolicy8);
        label_17->setMaximumSize(QSize(200, 16777215));

        gridLayout_37->addWidget(label_17, 0, 0, 1, 1);

        label_16 = new QLabel(createSkelGroup);
        label_16->setObjectName(QStringLiteral("label_16"));
        sizePolicy8.setHeightForWidth(label_16->sizePolicy().hasHeightForWidth());
        label_16->setSizePolicy(sizePolicy8);
        label_16->setMaximumSize(QSize(200, 16777215));

        gridLayout_37->addWidget(label_16, 0, 1, 1, 1);

        hsBt2Bt3Slider = new QSlider(createSkelGroup);
        hsBt2Bt3Slider->setObjectName(QStringLiteral("hsBt2Bt3Slider"));
        sizePolicy2.setHeightForWidth(hsBt2Bt3Slider->sizePolicy().hasHeightForWidth());
        hsBt2Bt3Slider->setSizePolicy(sizePolicy2);
        hsBt2Bt3Slider->setMaximumSize(QSize(200, 16777215));
        hsBt2Bt3Slider->setMaximum(1000);
        hsBt2Bt3Slider->setOrientation(Qt::Horizontal);

        gridLayout_37->addWidget(hsBt2Bt3Slider, 1, 0, 1, 1);

        hsBt1Bt2Slider = new QSlider(createSkelGroup);
        hsBt1Bt2Slider->setObjectName(QStringLiteral("hsBt1Bt2Slider"));
        sizePolicy2.setHeightForWidth(hsBt1Bt2Slider->sizePolicy().hasHeightForWidth());
        hsBt1Bt2Slider->setSizePolicy(sizePolicy2);
        hsBt1Bt2Slider->setMaximumSize(QSize(200, 16777215));
        hsBt1Bt2Slider->setMaximum(1000);
        hsBt1Bt2Slider->setOrientation(Qt::Horizontal);

        gridLayout_37->addWidget(hsBt1Bt2Slider, 1, 1, 1, 1);

        hsFaceDiffSpin = new QDoubleSpinBox(createSkelGroup);
        hsFaceDiffSpin->setObjectName(QStringLiteral("hsFaceDiffSpin"));
        hsFaceDiffSpin->setDecimals(5);
        hsFaceDiffSpin->setMaximum(1000);

        gridLayout_37->addWidget(hsFaceDiffSpin, 2, 0, 1, 1);

        hsCurveDiffSpin = new QDoubleSpinBox(createSkelGroup);
        hsCurveDiffSpin->setObjectName(QStringLiteral("hsCurveDiffSpin"));
        hsCurveDiffSpin->setDecimals(5);
        hsCurveDiffSpin->setMaximum(1e+9);

        gridLayout_37->addWidget(hsCurveDiffSpin, 2, 1, 1, 1);

        smoothSkelCurve = new QCheckBox(createSkelGroup);
        smoothSkelCurve->setObjectName(QStringLiteral("smoothSkelCurve"));

        gridLayout_37->addWidget(smoothSkelCurve, 3, 0, 1, 1);

        smoothSkelCurveSpin = new QSpinBox(createSkelGroup);
        smoothSkelCurveSpin->setObjectName(QStringLiteral("smoothSkelCurveSpin"));

        gridLayout_37->addWidget(smoothSkelCurveSpin, 3, 1, 1, 1);

        removeSmallCmpnts = new QCheckBox(createSkelGroup);
        removeSmallCmpnts->setObjectName(QStringLiteral("removeSmallCmpnts"));

        gridLayout_37->addWidget(removeSmallCmpnts, 4, 0, 1, 1);

        hsFaceDegenThreshold = new QDoubleSpinBox(createSkelGroup);
        hsFaceDegenThreshold->setObjectName(QStringLiteral("hsFaceDegenThreshold"));
        sizePolicy1.setHeightForWidth(hsFaceDegenThreshold->sizePolicy().hasHeightForWidth());
        hsFaceDegenThreshold->setSizePolicy(sizePolicy1);
        hsFaceDegenThreshold->setDecimals(8);

        gridLayout_37->addWidget(hsFaceDegenThreshold, 4, 1, 1, 1);

        createSkelBtn = new QPushButton(createSkelGroup);
        createSkelBtn->setObjectName(QStringLiteral("createSkelBtn"));
        sizePolicy2.setHeightForWidth(createSkelBtn->sizePolicy().hasHeightForWidth());
        createSkelBtn->setSizePolicy(sizePolicy2);
        createSkelBtn->setMaximumSize(QSize(150, 16777215));

        gridLayout_37->addWidget(createSkelBtn, 5, 0, 1, 1);

        exportHSBtn = new QPushButton(createSkelGroup);
        exportHSBtn->setObjectName(QStringLiteral("exportHSBtn"));

        gridLayout_37->addWidget(exportHSBtn, 5, 1, 1, 1);


        gridLayout_42->addWidget(createSkelGroup, 1, 0, 1, 1);

        verticalSpacer_9 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_42->addItem(verticalSpacer_9, 2, 0, 1, 1);

        toolTabs->addTab(skelTab, QString());
        MATab = new QWidget();
        MATab->setObjectName(QStringLiteral("MATab"));
        gridLayout_12 = new QGridLayout(MATab);
        gridLayout_12->setObjectName(QStringLiteral("gridLayout_12"));
        maBurnGroup = new QGroupBox(MATab);
        maBurnGroup->setObjectName(QStringLiteral("maBurnGroup"));
        QSizePolicy sizePolicy9(QSizePolicy::Expanding, QSizePolicy::Minimum);
        sizePolicy9.setHorizontalStretch(0);
        sizePolicy9.setVerticalStretch(0);
        sizePolicy9.setHeightForWidth(maBurnGroup->sizePolicy().hasHeightForWidth());
        maBurnGroup->setSizePolicy(sizePolicy9);
        gridLayout_5 = new QGridLayout(maBurnGroup);
        gridLayout_5->setObjectName(QStringLiteral("gridLayout_5"));
        burnBtn = new QPushButton(maBurnGroup);
        burnBtn->setObjectName(QStringLiteral("burnBtn"));
        burnBtn->setEnabled(true);
        sizePolicy5.setHeightForWidth(burnBtn->sizePolicy().hasHeightForWidth());
        burnBtn->setSizePolicy(sizePolicy5);
        burnBtn->setMinimumSize(QSize(40, 23));
        burnBtn->setMaximumSize(QSize(100, 23));

        gridLayout_5->addWidget(burnBtn, 1, 0, 1, 1);

        cleanTopoBtn = new QPushButton(maBurnGroup);
        cleanTopoBtn->setObjectName(QStringLiteral("cleanTopoBtn"));
        sizePolicy5.setHeightForWidth(cleanTopoBtn->sizePolicy().hasHeightForWidth());
        cleanTopoBtn->setSizePolicy(sizePolicy5);
        cleanTopoBtn->setMinimumSize(QSize(40, 23));
        cleanTopoBtn->setMaximumSize(QSize(100, 23));

        gridLayout_5->addWidget(cleanTopoBtn, 0, 1, 1, 1);


        gridLayout_12->addWidget(maBurnGroup, 0, 0, 1, 1);

        maMeasureGroup = new QGroupBox(MATab);
        maMeasureGroup->setObjectName(QStringLiteral("maMeasureGroup"));
        sizePolicy.setHeightForWidth(maMeasureGroup->sizePolicy().hasHeightForWidth());
        maMeasureGroup->setSizePolicy(sizePolicy);
        maMeasureGroup->setMaximumSize(QSize(250, 16777215));
        gridLayout_3 = new QGridLayout(maMeasureGroup);
        gridLayout_3->setObjectName(QStringLiteral("gridLayout_3"));
        pruneMADistCombo1 = new QComboBox(maMeasureGroup);
        pruneMADistCombo1->setObjectName(QStringLiteral("pruneMADistCombo1"));
        sizePolicy2.setHeightForWidth(pruneMADistCombo1->sizePolicy().hasHeightForWidth());
        pruneMADistCombo1->setSizePolicy(sizePolicy2);

        gridLayout_3->addWidget(pruneMADistCombo1, 0, 0, 1, 1);

        enableFinePruneMA = new QCheckBox(maMeasureGroup);
        enableFinePruneMA->setObjectName(QStringLiteral("enableFinePruneMA"));

        gridLayout_3->addWidget(enableFinePruneMA, 1, 0, 1, 1);


        gridLayout_12->addWidget(maMeasureGroup, 1, 0, 1, 1);

        exportBTGroup = new QGroupBox(MATab);
        exportBTGroup->setObjectName(QStringLiteral("exportBTGroup"));
        gridLayout_32 = new QGridLayout(exportBTGroup);
        gridLayout_32->setObjectName(QStringLiteral("gridLayout_32"));
        exportBTBtn = new QPushButton(exportBTGroup);
        exportBTBtn->setObjectName(QStringLiteral("exportBTBtn"));

        gridLayout_32->addWidget(exportBTBtn, 2, 1, 1, 1);

        exportPerSectorBTBox = new QCheckBox(exportBTGroup);
        exportPerSectorBTBox->setObjectName(QStringLiteral("exportPerSectorBTBox"));

        gridLayout_32->addWidget(exportPerSectorBTBox, 2, 0, 1, 1);


        gridLayout_12->addWidget(exportBTGroup, 2, 0, 1, 1);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_12->addItem(verticalSpacer, 3, 0, 1, 1);

        toolTabs->addTab(MATab, QString());
        HSTab = new QWidget();
        HSTab->setObjectName(QStringLiteral("HSTab"));
        gridLayout_34 = new QGridLayout(HSTab);
        gridLayout_34->setObjectName(QStringLiteral("gridLayout_34"));
        verticalSpacer_8 = new QSpacerItem(20, 365, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_34->addItem(verticalSpacer_8, 4, 1, 1, 1);

        hsCreateGroup = new QGroupBox(HSTab);
        hsCreateGroup->setObjectName(QStringLiteral("hsCreateGroup"));
        QSizePolicy sizePolicy10(QSizePolicy::Expanding, QSizePolicy::Preferred);
        sizePolicy10.setHorizontalStretch(0);
        sizePolicy10.setVerticalStretch(0);
        sizePolicy10.setHeightForWidth(hsCreateGroup->sizePolicy().hasHeightForWidth());
        hsCreateGroup->setSizePolicy(sizePolicy10);
        gridLayout_33 = new QGridLayout(hsCreateGroup);
        gridLayout_33->setObjectName(QStringLiteral("gridLayout_33"));
        createHSBtn = new QPushButton(hsCreateGroup);
        createHSBtn->setObjectName(QStringLiteral("createHSBtn"));
        sizePolicy2.setHeightForWidth(createHSBtn->sizePolicy().hasHeightForWidth());
        createHSBtn->setSizePolicy(sizePolicy2);

        gridLayout_33->addWidget(createHSBtn, 0, 0, 1, 1);


        gridLayout_34->addWidget(hsCreateGroup, 0, 0, 1, 2);

        mcPruneGroup = new QGroupBox(HSTab);
        mcPruneGroup->setObjectName(QStringLiteral("mcPruneGroup"));
        gridLayout_15 = new QGridLayout(mcPruneGroup);
        gridLayout_15->setObjectName(QStringLiteral("gridLayout_15"));

        gridLayout_34->addWidget(mcPruneGroup, 1, 0, 1, 2);

        exportHSGroup = new QGroupBox(HSTab);
        exportHSGroup->setObjectName(QStringLiteral("exportHSGroup"));
        gridLayout_35 = new QGridLayout(exportHSGroup);
        gridLayout_35->setObjectName(QStringLiteral("gridLayout_35"));

        gridLayout_34->addWidget(exportHSGroup, 3, 0, 1, 2);

        hsPruneGroup = new QGroupBox(HSTab);
        hsPruneGroup->setObjectName(QStringLiteral("hsPruneGroup"));
        gridLayout_18 = new QGridLayout(hsPruneGroup);
        gridLayout_18->setObjectName(QStringLiteral("gridLayout_18"));
        visHSBtn = new QPushButton(hsPruneGroup);
        visHSBtn->setObjectName(QStringLiteral("visHSBtn"));
        sizePolicy1.setHeightForWidth(visHSBtn->sizePolicy().hasHeightForWidth());
        visHSBtn->setSizePolicy(sizePolicy1);
        visHSBtn->setMaximumSize(QSize(150, 16777215));

        gridLayout_18->addWidget(visHSBtn, 6, 1, 1, 1);

        label_5 = new QLabel(hsPruneGroup);
        label_5->setObjectName(QStringLiteral("label_5"));
        sizePolicy8.setHeightForWidth(label_5->sizePolicy().hasHeightForWidth());
        label_5->setSizePolicy(sizePolicy8);
        label_5->setMaximumSize(QSize(200, 16777215));

        gridLayout_18->addWidget(label_5, 0, 0, 1, 1);

        label_7 = new QLabel(hsPruneGroup);
        label_7->setObjectName(QStringLiteral("label_7"));
        sizePolicy8.setHeightForWidth(label_7->sizePolicy().hasHeightForWidth());
        label_7->setSizePolicy(sizePolicy8);
        label_7->setMaximumSize(QSize(200, 16777215));

        gridLayout_18->addWidget(label_7, 0, 1, 1, 1);


        gridLayout_34->addWidget(hsPruneGroup, 2, 0, 1, 2);

        toolTabs->addTab(HSTab, QString());
        MCTab = new QWidget();
        MCTab->setObjectName(QStringLiteral("MCTab"));
        gridLayout_36 = new QGridLayout(MCTab);
        gridLayout_36->setObjectName(QStringLiteral("gridLayout_36"));
        verticalSpacer_4 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_36->addItem(verticalSpacer_4, 2, 0, 1, 1);

        mcDualizeGroup = new QGroupBox(MCTab);
        mcDualizeGroup->setObjectName(QStringLiteral("mcDualizeGroup"));
        gridLayout_7 = new QGridLayout(mcDualizeGroup);
        gridLayout_7->setObjectName(QStringLiteral("gridLayout_7"));
        dualizeBtn = new QPushButton(mcDualizeGroup);
        dualizeBtn->setObjectName(QStringLiteral("dualizeBtn"));

        gridLayout_7->addWidget(dualizeBtn, 0, 0, 1, 1);


        gridLayout_36->addWidget(mcDualizeGroup, 0, 0, 1, 1);

        mpGroup = new QGroupBox(MCTab);
        mpGroup->setObjectName(QStringLiteral("mpGroup"));
        gridLayout_21 = new QGridLayout(mpGroup);
        gridLayout_21->setObjectName(QStringLiteral("gridLayout_21"));
        showMPBox = new QCheckBox(mpGroup);
        showMPBox->setObjectName(QStringLiteral("showMPBox"));

        gridLayout_21->addWidget(showMPBox, 0, 0, 1, 1);


        gridLayout_36->addWidget(mpGroup, 1, 0, 1, 1);

        toolTabs->addTab(MCTab, QString());
        ExportTab = new QWidget();
        ExportTab->setObjectName(QStringLiteral("ExportTab"));
        gridLayout_29 = new QGridLayout(ExportTab);
        gridLayout_29->setObjectName(QStringLiteral("gridLayout_29"));
        exportGroup = new QGroupBox(ExportTab);
        exportGroup->setObjectName(QStringLiteral("exportGroup"));
        gridLayout_13 = new QGridLayout(exportGroup);
        gridLayout_13->setObjectName(QStringLiteral("gridLayout_13"));
        ExportSkelBox = new QCheckBox(exportGroup);
        ExportSkelBox->setObjectName(QStringLiteral("ExportSkelBox"));

        gridLayout_13->addWidget(ExportSkelBox, 1, 0, 1, 1);

        exportBtn = new QPushButton(exportGroup);
        exportBtn->setObjectName(QStringLiteral("exportBtn"));

        gridLayout_13->addWidget(exportBtn, 0, 0, 1, 1);


        gridLayout_29->addWidget(exportGroup, 0, 0, 1, 1);

        verticalSpacer_7 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_29->addItem(verticalSpacer_7, 1, 0, 1, 1);

        toolTabs->addTab(ExportTab, QString());
        SMetricTab = new QWidget();
        SMetricTab->setObjectName(QStringLiteral("SMetricTab"));
        gridLayout_20 = new QGridLayout(SMetricTab);
        gridLayout_20->setObjectName(QStringLiteral("gridLayout_20"));
        surfFuncGroup = new QGroupBox(SMetricTab);
        surfFuncGroup->setObjectName(QStringLiteral("surfFuncGroup"));
        gridLayout_19 = new QGridLayout(surfFuncGroup);
        gridLayout_19->setObjectName(QStringLiteral("gridLayout_19"));
        pruneSMetricCombo = new QComboBox(surfFuncGroup);
        pruneSMetricCombo->setObjectName(QStringLiteral("pruneSMetricCombo"));
        sizePolicy1.setHeightForWidth(pruneSMetricCombo->sizePolicy().hasHeightForWidth());
        pruneSMetricCombo->setSizePolicy(sizePolicy1);

        gridLayout_19->addWidget(pruneSMetricCombo, 5, 0, 1, 1);

        surfFuncProjectBtn = new QPushButton(surfFuncGroup);
        surfFuncProjectBtn->setObjectName(QStringLiteral("surfFuncProjectBtn"));
        sizePolicy1.setHeightForWidth(surfFuncProjectBtn->sizePolicy().hasHeightForWidth());
        surfFuncProjectBtn->setSizePolicy(sizePolicy1);

        gridLayout_19->addWidget(surfFuncProjectBtn, 6, 1, 1, 1);

        surfFuncCorrespSchemeCombo = new QComboBox(surfFuncGroup);
        surfFuncCorrespSchemeCombo->setObjectName(QStringLiteral("surfFuncCorrespSchemeCombo"));
        sizePolicy1.setHeightForWidth(surfFuncCorrespSchemeCombo->sizePolicy().hasHeightForWidth());
        surfFuncCorrespSchemeCombo->setSizePolicy(sizePolicy1);

        gridLayout_19->addWidget(surfFuncCorrespSchemeCombo, 2, 0, 1, 1);

        smoothSMetricSlider = new QSlider(surfFuncGroup);
        smoothSMetricSlider->setObjectName(QStringLiteral("smoothSMetricSlider"));
        smoothSMetricSlider->setMaximum(10000);
        smoothSMetricSlider->setOrientation(Qt::Horizontal);

        gridLayout_19->addWidget(smoothSMetricSlider, 5, 1, 1, 1);

        diffuseSurfFunc = new QCheckBox(surfFuncGroup);
        diffuseSurfFunc->setObjectName(QStringLiteral("diffuseSurfFunc"));

        gridLayout_19->addWidget(diffuseSurfFunc, 6, 0, 1, 1);

        surfFuncRadiusEps = new QDoubleSpinBox(surfFuncGroup);
        surfFuncRadiusEps->setObjectName(QStringLiteral("surfFuncRadiusEps"));
        surfFuncRadiusEps->setDecimals(8);
        surfFuncRadiusEps->setMinimum(-1);
        surfFuncRadiusEps->setMaximum(1);

        gridLayout_19->addWidget(surfFuncRadiusEps, 3, 0, 1, 1);

        surfFuncSetupCorrespBtn = new QPushButton(surfFuncGroup);
        surfFuncSetupCorrespBtn->setObjectName(QStringLiteral("surfFuncSetupCorrespBtn"));

        gridLayout_19->addWidget(surfFuncSetupCorrespBtn, 2, 1, 1, 1);

        surfFuncKNN = new QSpinBox(surfFuncGroup);
        surfFuncKNN->setObjectName(QStringLiteral("surfFuncKNN"));
        surfFuncKNN->setMinimum(1);

        gridLayout_19->addWidget(surfFuncKNN, 3, 1, 1, 1);


        gridLayout_20->addWidget(surfFuncGroup, 0, 0, 1, 1);

        verticalSpacer_5 = new QSpacerItem(20, 514, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_20->addItem(verticalSpacer_5, 1, 0, 1, 1);

        toolTabs->addTab(SMetricTab, QString());
        VideoTab = new QWidget();
        VideoTab->setObjectName(QStringLiteral("VideoTab"));
        gridLayout_23 = new QGridLayout(VideoTab);
        gridLayout_23->setObjectName(QStringLiteral("gridLayout_23"));
        isoSurfGroup = new QGroupBox(VideoTab);
        isoSurfGroup->setObjectName(QStringLiteral("isoSurfGroup"));
        gridLayout_24 = new QGridLayout(isoSurfGroup);
        gridLayout_24->setObjectName(QStringLiteral("gridLayout_24"));
        isoSurfPrecomputeBtn = new QPushButton(isoSurfGroup);
        isoSurfPrecomputeBtn->setObjectName(QStringLiteral("isoSurfPrecomputeBtn"));
        sizePolicy2.setHeightForWidth(isoSurfPrecomputeBtn->sizePolicy().hasHeightForWidth());
        isoSurfPrecomputeBtn->setSizePolicy(sizePolicy2);

        gridLayout_24->addWidget(isoSurfPrecomputeBtn, 0, 0, 1, 1);

        hideIsoSurf = new QCheckBox(isoSurfGroup);
        hideIsoSurf->setObjectName(QStringLiteral("hideIsoSurf"));
        sizePolicy2.setHeightForWidth(hideIsoSurf->sizePolicy().hasHeightForWidth());
        hideIsoSurf->setSizePolicy(sizePolicy2);

        gridLayout_24->addWidget(hideIsoSurf, 0, 1, 1, 1);

        recursiveRefineBox = new QCheckBox(isoSurfGroup);
        recursiveRefineBox->setObjectName(QStringLiteral("recursiveRefineBox"));

        gridLayout_24->addWidget(recursiveRefineBox, 4, 0, 1, 1);

        isoSurfSlider = new QSlider(isoSurfGroup);
        isoSurfSlider->setObjectName(QStringLiteral("isoSurfSlider"));
        sizePolicy6.setHeightForWidth(isoSurfSlider->sizePolicy().hasHeightForWidth());
        isoSurfSlider->setSizePolicy(sizePolicy6);
        isoSurfSlider->setMaximum(9999);
        isoSurfSlider->setSingleStep(5);
        isoSurfSlider->setPageStep(20);
        isoSurfSlider->setOrientation(Qt::Horizontal);

        gridLayout_24->addWidget(isoSurfSlider, 5, 1, 1, 1);

        hideSnappedFaceBox = new QCheckBox(isoSurfGroup);
        hideSnappedFaceBox->setObjectName(QStringLiteral("hideSnappedFaceBox"));

        gridLayout_24->addWidget(hideSnappedFaceBox, 5, 0, 1, 1);

        isoSurfRefineBtn = new QPushButton(isoSurfGroup);
        isoSurfRefineBtn->setObjectName(QStringLiteral("isoSurfRefineBtn"));

        gridLayout_24->addWidget(isoSurfRefineBtn, 4, 1, 1, 1);


        gridLayout_23->addWidget(isoSurfGroup, 0, 0, 1, 2);

        groupBox_7 = new QGroupBox(VideoTab);
        groupBox_7->setObjectName(QStringLiteral("groupBox_7"));
        gridLayout_25 = new QGridLayout(groupBox_7);
        gridLayout_25->setObjectName(QStringLiteral("gridLayout_25"));
        isoContPrecomputeBtn = new QPushButton(groupBox_7);
        isoContPrecomputeBtn->setObjectName(QStringLiteral("isoContPrecomputeBtn"));
        sizePolicy2.setHeightForWidth(isoContPrecomputeBtn->sizePolicy().hasHeightForWidth());
        isoContPrecomputeBtn->setSizePolicy(sizePolicy2);

        gridLayout_25->addWidget(isoContPrecomputeBtn, 1, 0, 1, 1);

        hideIsoCont = new QCheckBox(groupBox_7);
        hideIsoCont->setObjectName(QStringLiteral("hideIsoCont"));
        sizePolicy2.setHeightForWidth(hideIsoCont->sizePolicy().hasHeightForWidth());
        hideIsoCont->setSizePolicy(sizePolicy2);

        gridLayout_25->addWidget(hideIsoCont, 1, 1, 1, 1);

        isoContShowMC = new QCheckBox(groupBox_7);
        isoContShowMC->setObjectName(QStringLiteral("isoContShowMC"));

        gridLayout_25->addWidget(isoContShowMC, 2, 0, 1, 1);

        hidePastSurfBox = new QCheckBox(groupBox_7);
        hidePastSurfBox->setObjectName(QStringLiteral("hidePastSurfBox"));

        gridLayout_25->addWidget(hidePastSurfBox, 2, 1, 1, 1);

        isoContSlider = new QSlider(groupBox_7);
        isoContSlider->setObjectName(QStringLiteral("isoContSlider"));
        isoContSlider->setMaximum(9999);
        isoContSlider->setSingleStep(5);
        isoContSlider->setPageStep(20);
        isoContSlider->setOrientation(Qt::Horizontal);

        gridLayout_25->addWidget(isoContSlider, 3, 1, 1, 1);

        groupBox_9 = new QGroupBox(groupBox_7);
        groupBox_9->setObjectName(QStringLiteral("groupBox_9"));
        gridLayout_27 = new QGridLayout(groupBox_9);
        gridLayout_27->setObjectName(QStringLiteral("gridLayout_27"));
        isoContMinAlphaSlider = new QSlider(groupBox_9);
        isoContMinAlphaSlider->setObjectName(QStringLiteral("isoContMinAlphaSlider"));
        sizePolicy6.setHeightForWidth(isoContMinAlphaSlider->sizePolicy().hasHeightForWidth());
        isoContMinAlphaSlider->setSizePolicy(sizePolicy6);
        isoContMinAlphaSlider->setOrientation(Qt::Horizontal);

        gridLayout_27->addWidget(isoContMinAlphaSlider, 0, 0, 1, 1);

        isoContExpAlphaSlider = new QSlider(groupBox_9);
        isoContExpAlphaSlider->setObjectName(QStringLiteral("isoContExpAlphaSlider"));
        sizePolicy6.setHeightForWidth(isoContExpAlphaSlider->sizePolicy().hasHeightForWidth());
        isoContExpAlphaSlider->setSizePolicy(sizePolicy6);
        isoContExpAlphaSlider->setOrientation(Qt::Horizontal);

        gridLayout_27->addWidget(isoContExpAlphaSlider, 0, 1, 1, 1);


        gridLayout_25->addWidget(groupBox_9, 0, 0, 1, 2);


        gridLayout_23->addWidget(groupBox_7, 1, 0, 2, 2);

        verticalSpacer_6 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_23->addItem(verticalSpacer_6, 5, 0, 1, 1);

        groupBox_8 = new QGroupBox(VideoTab);
        groupBox_8->setObjectName(QStringLiteral("groupBox_8"));
        gridLayout_26 = new QGridLayout(groupBox_8);
        gridLayout_26->setObjectName(QStringLiteral("gridLayout_26"));
        evolveAllSlider = new QSlider(groupBox_8);
        evolveAllSlider->setObjectName(QStringLiteral("evolveAllSlider"));
        evolveAllSlider->setMaximum(9999);
        evolveAllSlider->setSingleStep(5);
        evolveAllSlider->setPageStep(20);
        evolveAllSlider->setOrientation(Qt::Horizontal);

        gridLayout_26->addWidget(evolveAllSlider, 1, 1, 1, 1);

        evolveAllPrecomputeBtn = new QPushButton(groupBox_8);
        evolveAllPrecomputeBtn->setObjectName(QStringLiteral("evolveAllPrecomputeBtn"));

        gridLayout_26->addWidget(evolveAllPrecomputeBtn, 1, 0, 1, 1);

        evolveAllShowEntireMC = new QCheckBox(groupBox_8);
        evolveAllShowEntireMC->setObjectName(QStringLiteral("evolveAllShowEntireMC"));

        gridLayout_26->addWidget(evolveAllShowEntireMC, 2, 0, 1, 1);


        gridLayout_23->addWidget(groupBox_8, 4, 0, 1, 2);

        toolTabs->addTab(VideoTab, QString());
        MiscTab = new QWidget();
        MiscTab->setObjectName(QStringLiteral("MiscTab"));
        gridLayout_31 = new QGridLayout(MiscTab);
        gridLayout_31->setObjectName(QStringLiteral("gridLayout_31"));
        verticalSpacer_2 = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        gridLayout_31->addItem(verticalSpacer_2, 4, 0, 1, 1);

        preprocessGroup = new QGroupBox(MiscTab);
        preprocessGroup->setObjectName(QStringLiteral("preprocessGroup"));
        preprocessGroup->setMaximumSize(QSize(1000, 16777215));
        gridLayout = new QGridLayout(preprocessGroup);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        label_2 = new QLabel(preprocessGroup);
        label_2->setObjectName(QStringLiteral("label_2"));

        gridLayout->addWidget(label_2, 0, 0, 1, 1);

        pertSpin = new QDoubleSpinBox(preprocessGroup);
        pertSpin->setObjectName(QStringLiteral("pertSpin"));
        pertSpin->setDecimals(15);

        gridLayout->addWidget(pertSpin, 4, 1, 1, 1);

        label = new QLabel(preprocessGroup);
        label->setObjectName(QStringLiteral("label"));

        gridLayout->addWidget(label, 4, 0, 1, 1);

        epsilonSpin = new QDoubleSpinBox(preprocessGroup);
        epsilonSpin->setObjectName(QStringLiteral("epsilonSpin"));
        epsilonSpin->setDecimals(15);

        gridLayout->addWidget(epsilonSpin, 0, 1, 1, 1);


        gridLayout_31->addWidget(preprocessGroup, 0, 0, 1, 1);

        miscBurntimeGroup = new QGroupBox(MiscTab);
        miscBurntimeGroup->setObjectName(QStringLiteral("miscBurntimeGroup"));
        gridLayout_28 = new QGridLayout(miscBurntimeGroup);
        gridLayout_28->setObjectName(QStringLiteral("gridLayout_28"));
        visSphereFromFileBtn = new QPushButton(miscBurntimeGroup);
        visSphereFromFileBtn->setObjectName(QStringLiteral("visSphereFromFileBtn"));

        gridLayout_28->addWidget(visSphereFromFileBtn, 2, 0, 1, 1);

        visSphereSpin = new QSpinBox(miscBurntimeGroup);
        visSphereSpin->setObjectName(QStringLiteral("visSphereSpin"));

        gridLayout_28->addWidget(visSphereSpin, 1, 1, 1, 1);

        randBTBtn = new QPushButton(miscBurntimeGroup);
        randBTBtn->setObjectName(QStringLiteral("randBTBtn"));

        gridLayout_28->addWidget(randBTBtn, 4, 0, 1, 1);

        printBTBtn = new QPushButton(miscBurntimeGroup);
        printBTBtn->setObjectName(QStringLiteral("printBTBtn"));

        gridLayout_28->addWidget(printBTBtn, 4, 1, 1, 1);

        visSphereSlider = new QSlider(miscBurntimeGroup);
        visSphereSlider->setObjectName(QStringLiteral("visSphereSlider"));
        sizePolicy5.setHeightForWidth(visSphereSlider->sizePolicy().hasHeightForWidth());
        visSphereSlider->setSizePolicy(sizePolicy5);
        visSphereSlider->setOrientation(Qt::Horizontal);

        gridLayout_28->addWidget(visSphereSlider, 1, 0, 1, 1);

        showSphereBox = new QCheckBox(miscBurntimeGroup);
        showSphereBox->setObjectName(QStringLiteral("showSphereBox"));

        gridLayout_28->addWidget(showSphereBox, 0, 0, 1, 1);

        printSelectVertInfoBtn = new QPushButton(miscBurntimeGroup);
        printSelectVertInfoBtn->setObjectName(QStringLiteral("printSelectVertInfoBtn"));

        gridLayout_28->addWidget(printSelectVertInfoBtn, 2, 1, 1, 1);


        gridLayout_31->addWidget(miscBurntimeGroup, 1, 0, 1, 1);

        renderParamGroup = new QGroupBox(MiscTab);
        renderParamGroup->setObjectName(QStringLiteral("renderParamGroup"));
        sizePolicy7.setHeightForWidth(renderParamGroup->sizePolicy().hasHeightForWidth());
        renderParamGroup->setSizePolicy(sizePolicy7);
        formLayout_3 = new QFormLayout(renderParamGroup);
        formLayout_3->setObjectName(QStringLiteral("formLayout_3"));
        label_3 = new QLabel(renderParamGroup);
        label_3->setObjectName(QStringLiteral("label_3"));

        formLayout_3->setWidget(1, QFormLayout::LabelRole, label_3);

        linesRenderOffsetSlider = new QSlider(renderParamGroup);
        linesRenderOffsetSlider->setObjectName(QStringLiteral("linesRenderOffsetSlider"));
        linesRenderOffsetSlider->setMaximum(1000000);
        linesRenderOffsetSlider->setOrientation(Qt::Horizontal);

        formLayout_3->setWidget(1, QFormLayout::FieldRole, linesRenderOffsetSlider);


        gridLayout_31->addWidget(renderParamGroup, 2, 0, 1, 1);

        qmatGroup = new QGroupBox(MiscTab);
        qmatGroup->setObjectName(QStringLiteral("qmatGroup"));
        QSizePolicy sizePolicy11(QSizePolicy::Preferred, QSizePolicy::Expanding);
        sizePolicy11.setHorizontalStretch(0);
        sizePolicy11.setVerticalStretch(0);
        sizePolicy11.setHeightForWidth(qmatGroup->sizePolicy().hasHeightForWidth());
        qmatGroup->setSizePolicy(sizePolicy11);
        formLayout_4 = new QFormLayout(qmatGroup);
        formLayout_4->setObjectName(QStringLiteral("formLayout_4"));
        label_9 = new QLabel(qmatGroup);
        label_9->setObjectName(QStringLiteral("label_9"));
        sizePolicy10.setHeightForWidth(label_9->sizePolicy().hasHeightForWidth());
        label_9->setSizePolicy(sizePolicy10);

        formLayout_4->setWidget(0, QFormLayout::LabelRole, label_9);

        outputWenpingBtn = new QPushButton(qmatGroup);
        outputWenpingBtn->setObjectName(QStringLiteral("outputWenpingBtn"));
        sizePolicy2.setHeightForWidth(outputWenpingBtn->sizePolicy().hasHeightForWidth());
        outputWenpingBtn->setSizePolicy(sizePolicy2);

        formLayout_4->setWidget(0, QFormLayout::FieldRole, outputWenpingBtn);

        readQMatMA = new QPushButton(qmatGroup);
        readQMatMA->setObjectName(QStringLiteral("readQMatMA"));
        sizePolicy2.setHeightForWidth(readQMatMA->sizePolicy().hasHeightForWidth());
        readQMatMA->setSizePolicy(sizePolicy2);

        formLayout_4->setWidget(1, QFormLayout::LabelRole, readQMatMA);

        hideQMatBox = new QCheckBox(qmatGroup);
        hideQMatBox->setObjectName(QStringLiteral("hideQMatBox"));
        sizePolicy2.setHeightForWidth(hideQMatBox->sizePolicy().hasHeightForWidth());
        hideQMatBox->setSizePolicy(sizePolicy2);

        formLayout_4->setWidget(1, QFormLayout::FieldRole, hideQMatBox);


        gridLayout_31->addWidget(qmatGroup, 3, 0, 1, 1);

        toolTabs->addTab(MiscTab, QString());
        hiddenTab = new QWidget();
        hiddenTab->setObjectName(QStringLiteral("hiddenTab"));
        stSubdivCombo = new QComboBox(hiddenTab);
        stSubdivCombo->setObjectName(QStringLiteral("stSubdivCombo"));
        stSubdivCombo->setGeometry(QRect(160, 10, 69, 20));
        QSizePolicy sizePolicy12(QSizePolicy::Minimum, QSizePolicy::Expanding);
        sizePolicy12.setHorizontalStretch(0);
        sizePolicy12.setVerticalStretch(0);
        sizePolicy12.setHeightForWidth(stSubdivCombo->sizePolicy().hasHeightForWidth());
        stSubdivCombo->setSizePolicy(sizePolicy12);
        stSubdivCombo->setMaximumSize(QSize(100, 20));
        edgeWeightCombo = new QComboBox(hiddenTab);
        edgeWeightCombo->setObjectName(QStringLiteral("edgeWeightCombo"));
        edgeWeightCombo->setEnabled(true);
        edgeWeightCombo->setGeometry(QRect(71, 6, 69, 20));
        sizePolicy12.setHeightForWidth(edgeWeightCombo->sizePolicy().hasHeightForWidth());
        edgeWeightCombo->setSizePolicy(sizePolicy12);
        edgeWeightCombo->setMaximumSize(QSize(100, 20));
        pointSizeSpin = new QDoubleSpinBox(hiddenTab);
        pointSizeSpin->setObjectName(QStringLiteral("pointSizeSpin"));
        pointSizeSpin->setGeometry(QRect(9, 6, 49, 20));
        sizePolicy5.setHeightForWidth(pointSizeSpin->sizePolicy().hasHeightForWidth());
        pointSizeSpin->setSizePolicy(sizePolicy5);
        pointSizeSpin->setMaximumSize(QSize(100, 20));
        doMAFaceScalarDiffusion = new QCheckBox(hiddenTab);
        doMAFaceScalarDiffusion->setObjectName(QStringLiteral("doMAFaceScalarDiffusion"));
        doMAFaceScalarDiffusion->setGeometry(QRect(91, 31, 103, 17));
        computeAllDistBtn = new QPushButton(hiddenTab);
        computeAllDistBtn->setObjectName(QStringLiteral("computeAllDistBtn"));
        computeAllDistBtn->setGeometry(QRect(10, 30, 75, 23));
        usePerSheetBox = new QCheckBox(hiddenTab);
        usePerSheetBox->setObjectName(QStringLiteral("usePerSheetBox"));
        usePerSheetBox->setGeometry(QRect(201, 31, 69, 17));
        maxPruneDistMASpin2 = new QDoubleSpinBox(hiddenTab);
        maxPruneDistMASpin2->setObjectName(QStringLiteral("maxPruneDistMASpin2"));
        maxPruneDistMASpin2->setGeometry(QRect(131, 131, 97, 20));
        maxPruneDistMASpin2->setDecimals(10);
        maPruneRatio = new QDoubleSpinBox(hiddenTab);
        maPruneRatio->setObjectName(QStringLiteral("maPruneRatio"));
        maPruneRatio->setGeometry(QRect(11, 61, 97, 20));
        maPruneRatio->setDecimals(8);
        minPruneDistMASpin1 = new QDoubleSpinBox(hiddenTab);
        minPruneDistMASpin1->setObjectName(QStringLiteral("minPruneDistMASpin1"));
        minPruneDistMASpin1->setGeometry(QRect(8, 83, 107, 20));
        minPruneDistMASpin1->setDecimals(10);
        pruneMASpin2 = new QDoubleSpinBox(hiddenTab);
        pruneMASpin2->setObjectName(QStringLiteral("pruneMASpin2"));
        pruneMASpin2->setGeometry(QRect(11, 111, 107, 20));
        pruneMASpin2->setDecimals(30);
        maxPruneDistMASpin1 = new QDoubleSpinBox(hiddenTab);
        maxPruneDistMASpin1->setObjectName(QStringLiteral("maxPruneDistMASpin1"));
        maxPruneDistMASpin1->setGeometry(QRect(111, 61, 97, 20));
        maxPruneDistMASpin1->setDecimals(10);
        pruneMASlider2 = new QSlider(hiddenTab);
        pruneMASlider2->setObjectName(QStringLiteral("pruneMASlider2"));
        pruneMASlider2->setGeometry(QRect(131, 81, 107, 19));
        pruneMASlider2->setOrientation(Qt::Horizontal);
        pruneMADistCombo2 = new QComboBox(hiddenTab);
        pruneMADistCombo2->setObjectName(QStringLiteral("pruneMADistCombo2"));
        pruneMADistCombo2->setGeometry(QRect(131, 111, 97, 20));
        minPruneDistMASpin2 = new QDoubleSpinBox(hiddenTab);
        minPruneDistMASpin2->setObjectName(QStringLiteral("minPruneDistMASpin2"));
        minPruneDistMASpin2->setGeometry(QRect(11, 131, 107, 20));
        minPruneDistMASpin2->setDecimals(10);
        edgeDualOptCombo = new QComboBox(hiddenTab);
        edgeDualOptCombo->setObjectName(QStringLiteral("edgeDualOptCombo"));
        edgeDualOptCombo->setGeometry(QRect(0, 161, 115, 20));
        polyDualOptCombo = new QComboBox(hiddenTab);
        polyDualOptCombo->setObjectName(QStringLiteral("polyDualOptCombo"));
        polyDualOptCombo->setGeometry(QRect(121, 161, 115, 20));
        underEstimateBox = new QCheckBox(hiddenTab);
        underEstimateBox->setObjectName(QStringLiteral("underEstimateBox"));
        underEstimateBox->setGeometry(QRect(130, 213, 115, 17));
        onlyUnburntBox = new QCheckBox(hiddenTab);
        onlyUnburntBox->setObjectName(QStringLiteral("onlyUnburntBox"));
        onlyUnburntBox->setGeometry(QRect(9, 190, 115, 17));
        stopAtJuncBox = new QCheckBox(hiddenTab);
        stopAtJuncBox->setObjectName(QStringLiteral("stopAtJuncBox"));
        stopAtJuncBox->setGeometry(QRect(9, 213, 115, 17));
        protectBT2Box = new QCheckBox(hiddenTab);
        protectBT2Box->setObjectName(QStringLiteral("protectBT2Box"));
        protectBT2Box->setGeometry(QRect(130, 190, 115, 17));
        hsBt1Bt2RelSlider = new QSlider(hiddenTab);
        hsBt1Bt2RelSlider->setObjectName(QStringLiteral("hsBt1Bt2RelSlider"));
        hsBt1Bt2RelSlider->setGeometry(QRect(130, 260, 115, 19));
        hsBt1Bt2RelSlider->setMaximum(1000);
        hsBt1Bt2RelSlider->setOrientation(Qt::Horizontal);
        hsCurveRelDiffSpin = new QDoubleSpinBox(hiddenTab);
        hsCurveRelDiffSpin->setObjectName(QStringLiteral("hsCurveRelDiffSpin"));
        hsCurveRelDiffSpin->setGeometry(QRect(120, 300, 115, 20));
        hsCurveRelDiffSpin->setDecimals(8);
        hsFaceRelDiffSpin = new QDoubleSpinBox(hiddenTab);
        hsFaceRelDiffSpin->setObjectName(QStringLiteral("hsFaceRelDiffSpin"));
        hsFaceRelDiffSpin->setGeometry(QRect(120, 278, 115, 20));
        hsFaceRelDiffSpin->setDecimals(8);
        hsBt2Bt3RelSlider = new QSlider(hiddenTab);
        hsBt2Bt3RelSlider->setObjectName(QStringLiteral("hsBt2Bt3RelSlider"));
        hsBt2Bt3RelSlider->setGeometry(QRect(131, 240, 115, 19));
        hsBt2Bt3RelSlider->setMaximum(1000);
        hsBt2Bt3RelSlider->setOrientation(Qt::Horizontal);
        label_8 = new QLabel(hiddenTab);
        label_8->setObjectName(QStringLiteral("label_8"));
        label_8->setGeometry(QRect(9, 260, 115, 19));
        label_6 = new QLabel(hiddenTab);
        label_6->setObjectName(QStringLiteral("label_6"));
        label_6->setGeometry(QRect(10, 240, 115, 19));
        hsCmpntFaceNumTSpin = new QDoubleSpinBox(hiddenTab);
        hsCmpntFaceNumTSpin->setObjectName(QStringLiteral("hsCmpntFaceNumTSpin"));
        hsCmpntFaceNumTSpin->setGeometry(QRect(0, 320, 115, 20));
        hsCmpntFaceNumTSpin->setDecimals(8);
        hsCmpntFaceNumTSpin->setMaximum(999999);
        mcBurnGroup = new QGroupBox(hiddenTab);
        mcBurnGroup->setObjectName(QStringLiteral("mcBurnGroup"));
        mcBurnGroup->setGeometry(QRect(10, 350, 71, 61));
        gridLayout_14 = new QGridLayout(mcBurnGroup);
        gridLayout_14->setObjectName(QStringLiteral("gridLayout_14"));
        burnMedialCurveBtn = new QPushButton(mcBurnGroup);
        burnMedialCurveBtn->setObjectName(QStringLiteral("burnMedialCurveBtn"));

        gridLayout_14->addWidget(burnMedialCurveBtn, 0, 0, 1, 1);

        printMCStatsBtn = new QPushButton(hiddenTab);
        printMCStatsBtn->setObjectName(QStringLiteral("printMCStatsBtn"));
        printMCStatsBtn->setGeometry(QRect(120, 330, 115, 23));
        pruneMCSlider2 = new QSlider(hiddenTab);
        pruneMCSlider2->setObjectName(QStringLiteral("pruneMCSlider2"));
        pruneMCSlider2->setGeometry(QRect(10, 424, 115, 19));
        pruneMCSlider2->setOrientation(Qt::Horizontal);
        mcPruneRatio = new QDoubleSpinBox(hiddenTab);
        mcPruneRatio->setObjectName(QStringLiteral("mcPruneRatio"));
        mcPruneRatio->setGeometry(QRect(130, 400, 115, 20));
        sizePolicy2.setHeightForWidth(mcPruneRatio->sizePolicy().hasHeightForWidth());
        mcPruneRatio->setSizePolicy(sizePolicy2);
        mcPruneRatio->setDecimals(10);
        pruneMCDistCombo2 = new QComboBox(hiddenTab);
        pruneMCDistCombo2->setObjectName(QStringLiteral("pruneMCDistCombo2"));
        pruneMCDistCombo2->setGeometry(QRect(131, 424, 115, 20));
        pruneMCDistSpin2 = new QDoubleSpinBox(hiddenTab);
        pruneMCDistSpin2->setObjectName(QStringLiteral("pruneMCDistSpin2"));
        pruneMCDistSpin2->setGeometry(QRect(10, 450, 115, 20));
        pruneMCDistSpin2->setDecimals(10);
        colorPerVert = new QRadioButton(hiddenTab);
        colorPerVert->setObjectName(QStringLiteral("colorPerVert"));
        colorPerVert->setGeometry(QRect(12, 480, 102, 17));
        colorPerFace = new QRadioButton(hiddenTab);
        colorPerFace->setObjectName(QStringLiteral("colorPerFace"));
        colorPerFace->setGeometry(QRect(120, 480, 102, 17));
        hsUseTypedInput = new QCheckBox(hiddenTab);
        hsUseTypedInput->setObjectName(QStringLiteral("hsUseTypedInput"));
        hsUseTypedInput->setGeometry(QRect(10, 500, 115, 17));
        visBallStick = new QCheckBox(hiddenTab);
        visBallStick->setObjectName(QStringLiteral("visBallStick"));
        visBallStick->setGeometry(QRect(9, 520, 115, 17));
        sizePolicy2.setHeightForWidth(visBallStick->sizePolicy().hasHeightForWidth());
        visBallStick->setSizePolicy(sizePolicy2);
        preserveMCTopo = new QCheckBox(hiddenTab);
        preserveMCTopo->setObjectName(QStringLiteral("preserveMCTopo"));
        preserveMCTopo->setGeometry(QRect(130, 520, 115, 17));
        toolTabs->addTab(hiddenTab, QString());
        splitter->addWidget(toolTabs);
        layoutWidget = new QWidget(splitter);
        layoutWidget->setObjectName(QStringLiteral("layoutWidget"));
        glLayout = new QHBoxLayout(layoutWidget);
        glLayout->setObjectName(QStringLiteral("glLayout"));
        glLayout->setContentsMargins(0, 0, 0, 0);
        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        glLayout->addItem(horizontalSpacer);

        splitter->addWidget(layoutWidget);

        gridLayout_11->addWidget(splitter, 0, 0, 1, 1);

        MainWindow->setCentralWidget(centralwidget);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName(QStringLiteral("statusbar"));
        MainWindow->setStatusBar(statusbar);

        retranslateUi(MainWindow);

        toolTabs->setCurrentIndex(1);


        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", nullptr));
        openFile->setText(QApplication::translate("MainWindow", "&Open", nullptr));
        saveView->setText(QApplication::translate("MainWindow", "Save View", nullptr));
#ifndef QT_NO_TOOLTIP
        saveView->setToolTip(QApplication::translate("MainWindow", "Save camera & viewport to file", nullptr));
#endif // QT_NO_TOOLTIP
        loadView->setText(QApplication::translate("MainWindow", "Load View", nullptr));
#ifndef QT_NO_TOOLTIP
        loadView->setToolTip(QApplication::translate("MainWindow", "Load a saved view from file", nullptr));
#endif // QT_NO_TOOLTIP
        readRadii->setText(QApplication::translate("MainWindow", "Read Radii", nullptr));
#ifndef QT_NO_TOOLTIP
        readRadii->setToolTip(QApplication::translate("MainWindow", "read radii of MA from .r file", nullptr));
#endif // QT_NO_TOOLTIP
        actionHelp->setText(QApplication::translate("MainWindow", "Help", nullptr));
#ifndef QT_NO_TOOLTIP
        toolTabs->setToolTip(QString());
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        fileTab->setToolTip(QApplication::translate("MainWindow", "Load all required files here", nullptr));
#endif // QT_NO_TOOLTIP
        loadFileGroup->setTitle(QString());
        label_11->setText(QApplication::translate("MainWindow", "medial axis", nullptr));
#ifndef QT_NO_TOOLTIP
        maFileEdit->setToolTip(QApplication::translate("MainWindow", "the medial axis file", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        browseMAFileBtn->setToolTip(QApplication::translate("MainWindow", "select a medial axis file (.off)", nullptr));
#endif // QT_NO_TOOLTIP
        browseMAFileBtn->setText(QApplication::translate("MainWindow", "browse", nullptr));
        label_12->setText(QApplication::translate("MainWindow", "3d shape", nullptr));
#ifndef QT_NO_TOOLTIP
        shapeFileEdit->setToolTip(QApplication::translate("MainWindow", "the 3d shape file (optional)", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        browse3DShapeFileBtn->setToolTip(QApplication::translate("MainWindow", "select a 3d shape file (.off)", nullptr));
#endif // QT_NO_TOOLTIP
        browse3DShapeFileBtn->setText(QApplication::translate("MainWindow", "browse", nullptr));
        label_13->setText(QApplication::translate("MainWindow", "radius", nullptr));
#ifndef QT_NO_TOOLTIP
        radiusFileEdit->setToolTip(QApplication::translate("MainWindow", "the radius file (optional)", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        browseRadiusFileBtn->setToolTip(QApplication::translate("MainWindow", "(optionally) select a radius file (.r)", nullptr));
#endif // QT_NO_TOOLTIP
        browseRadiusFileBtn->setText(QApplication::translate("MainWindow", "browse", nullptr));
        loadFilesBtn->setText(QApplication::translate("MainWindow", "load", nullptr));
        removeDupFace->setText(QApplication::translate("MainWindow", "remove dup", nullptr));
        toolTabs->setTabText(toolTabs->indexOf(fileTab), QApplication::translate("MainWindow", "Files", nullptr));
#ifndef QT_NO_TOOLTIP
        origSurfTab->setToolTip(QApplication::translate("MainWindow", "<html><head/>\n"
"<body>visualizatoin options for<br>\n"
"- 3d shape<br>\n"
"- medial axis <br>\n"
"- medial curve <br>\n"
"- skeleton <br>\n"
"</body></html>", nullptr));
#endif // QT_NO_TOOLTIP
        groupBox->setTitle(QApplication::translate("MainWindow", "general visualization", nullptr));
#ifndef QT_NO_TOOLTIP
        colorBGBtn->setToolTip(QApplication::translate("MainWindow", "change background color", nullptr));
#endif // QT_NO_TOOLTIP
        colorBGBtn->setText(QApplication::translate("MainWindow", "BG color", nullptr));
#ifndef QT_NO_TOOLTIP
        drawEdge->setToolTip(QApplication::translate("MainWindow", "show wireframe on original shape and medial axis", nullptr));
#endif // QT_NO_TOOLTIP
        drawEdge->setText(QApplication::translate("MainWindow", "wire-frame", nullptr));
#ifndef QT_NO_TOOLTIP
        saveViewBtn->setToolTip(QApplication::translate("MainWindow", "Save camera & viewport to file", nullptr));
#endif // QT_NO_TOOLTIP
        saveViewBtn->setText(QApplication::translate("MainWindow", "save view", nullptr));
#ifndef QT_NO_TOOLTIP
        loadViewBtn->setToolTip(QApplication::translate("MainWindow", "Load a saved view from file", nullptr));
#endif // QT_NO_TOOLTIP
        loadViewBtn->setText(QApplication::translate("MainWindow", "load view", nullptr));
#ifndef QT_NO_TOOLTIP
        useTrueTransparencyBox->setToolTip(QApplication::translate("MainWindow", "<html><head/>\n"
"<body>\n"
"<p>use &quot;ground truth&quot; transparency (depth-peel) instead of opengl default alpha blending <br>\n"
"(need to specify # layers for which transparency will be computed)</p>\n"
"</body></html>", nullptr));
#endif // QT_NO_TOOLTIP
        useTrueTransparencyBox->setText(QApplication::translate("MainWindow", "true transparency", nullptr));
#ifndef QT_NO_TOOLTIP
        DPMaxRendersSpin->setToolTip(QApplication::translate("MainWindow", "specify # layers here", nullptr));
#endif // QT_NO_TOOLTIP
        label_10->setText(QApplication::translate("MainWindow", "line width", nullptr));
#ifndef QT_NO_TOOLTIP
        MCWidthSpin->setToolTip(QApplication::translate("MainWindow", "medial curve line width", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        origSurfViewGroup->setToolTip(QApplication::translate("MainWindow", "view options for 3d shape", nullptr));
#endif // QT_NO_TOOLTIP
        origSurfViewGroup->setTitle(QString());
#ifndef QT_NO_TOOLTIP
        hideOrig->setToolTip(QApplication::translate("MainWindow", "hide/show current 3d surface", nullptr));
#endif // QT_NO_TOOLTIP
        hideOrig->setText(QApplication::translate("MainWindow", "hide shape", nullptr));
#ifndef QT_NO_TOOLTIP
        colorOrigBtn->setToolTip(QApplication::translate("MainWindow", "Give 3d surface constant color", nullptr));
#endif // QT_NO_TOOLTIP
        colorOrigBtn->setText(QApplication::translate("MainWindow", "shape color", nullptr));
        label_4->setText(QApplication::translate("MainWindow", "shape transparency", nullptr));
#ifndef QT_NO_TOOLTIP
        origTransparentSlider->setToolTip(QApplication::translate("MainWindow", "change transparency of the 3D surface", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        mcViewGroup->setToolTip(QApplication::translate("MainWindow", "options for viewing the MC and the measures on it", nullptr));
#endif // QT_NO_TOOLTIP
        mcViewGroup->setTitle(QApplication::translate("MainWindow", "medial curve visualization", nullptr));
#ifndef QT_NO_TOOLTIP
        visBurnt->setToolTip(QApplication::translate("MainWindow", "visualize all burn trees", nullptr));
#endif // QT_NO_TOOLTIP
        visBurnt->setText(QApplication::translate("MainWindow", "show burn trees", nullptr));
#ifndef QT_NO_TOOLTIP
        colorMCBtn->setToolTip(QApplication::translate("MainWindow", "Give MC a constant color", nullptr));
#endif // QT_NO_TOOLTIP
        colorMCBtn->setText(QApplication::translate("MainWindow", "color", nullptr));
#ifndef QT_NO_TOOLTIP
        hideMC->setToolTip(QApplication::translate("MainWindow", "hide/show medial curve", nullptr));
#endif // QT_NO_TOOLTIP
        hideMC->setText(QApplication::translate("MainWindow", "hide MC", nullptr));
#ifndef QT_NO_TOOLTIP
        groupBox_2->setToolTip(QApplication::translate("MainWindow", "pick a measure to view on medial curve here", nullptr));
#endif // QT_NO_TOOLTIP
        groupBox_2->setTitle(QString());
        label_20->setText(QApplication::translate("MainWindow", "viewing", nullptr));
#ifndef QT_NO_TOOLTIP
        visMCDistCombo->setToolTip(QApplication::translate("MainWindow", "choose a measure on medial curve to visualize", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        pruneMCDistSpin1->setToolTip(QApplication::translate("MainWindow", "cur value of threshold", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        clampMCDistBox->setToolTip(QApplication::translate("MainWindow", "map the the selected measure to the right range", nullptr));
#endif // QT_NO_TOOLTIP
        clampMCDistBox->setText(QString());
#ifndef QT_NO_TOOLTIP
        minVisDistMCSpin->setToolTip(QApplication::translate("MainWindow", "min of the clamp range", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        maxVisDistMCSpin->setToolTip(QApplication::translate("MainWindow", "max of the clamp range", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        pruneMCDistCombo1->setToolTip(QApplication::translate("MainWindow", "choose distance metric used for pruning", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        pruneMCSlider1->setToolTip(QApplication::translate("MainWindow", "threshold MC by measure", nullptr));
#endif // QT_NO_TOOLTIP
        label_21->setText(QApplication::translate("MainWindow", "thresholding", nullptr));
#ifndef QT_NO_TOOLTIP
        MCAlphaSlider->setToolTip(QApplication::translate("MainWindow", "min alpha", nullptr));
#endif // QT_NO_TOOLTIP
        label_18->setText(QApplication::translate("MainWindow", "transparency", nullptr));
#ifndef QT_NO_TOOLTIP
        MCTransExpSlider->setToolTip(QApplication::translate("MainWindow", "alpha exponent", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        maViewGroup->setToolTip(QApplication::translate("MainWindow", "view options for medial axis", nullptr));
#endif // QT_NO_TOOLTIP
        maViewGroup->setTitle(QApplication::translate("MainWindow", "medial axis visualization", nullptr));
#ifndef QT_NO_TOOLTIP
        hideMA->setToolTip(QApplication::translate("MainWindow", "hide/show medial axis", nullptr));
#endif // QT_NO_TOOLTIP
        hideMA->setText(QApplication::translate("MainWindow", "hide", nullptr));
#ifndef QT_NO_TOOLTIP
        turnOffLightingForMABox->setToolTip(QApplication::translate("MainWindow", "disable/enable lighting on medial axis", nullptr));
#endif // QT_NO_TOOLTIP
        turnOffLightingForMABox->setText(QApplication::translate("MainWindow", "no lighting", nullptr));
#ifndef QT_NO_TOOLTIP
        drawStPoints->setToolTip(QApplication::translate("MainWindow", "visualize all steiner points on medial axis", nullptr));
#endif // QT_NO_TOOLTIP
        drawStPoints->setText(QApplication::translate("MainWindow", "steiner points", nullptr));
        hideMALine->setText(QApplication::translate("MainWindow", "hide 1d cells", nullptr));
#ifndef QT_NO_TOOLTIP
        colorMABtn->setToolTip(QApplication::translate("MainWindow", "Give MA a constant color", nullptr));
#endif // QT_NO_TOOLTIP
        colorMABtn->setText(QApplication::translate("MainWindow", "color", nullptr));
#ifndef QT_NO_TOOLTIP
        distVisBtnGroup->setToolTip(QApplication::translate("MainWindow", "pick a measure to visualize on the medial axis", nullptr));
#endif // QT_NO_TOOLTIP
        distVisBtnGroup->setTitle(QString());
        label_19->setText(QApplication::translate("MainWindow", "view measure", nullptr));
#ifndef QT_NO_TOOLTIP
        visMADistCombo->setToolTip(QApplication::translate("MainWindow", "choose a distance metric to visualize on medial axis", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        pruneMASlider1->setToolTip(QApplication::translate("MainWindow", "threshold MA by the specified metric", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        pruneMASpin1->setToolTip(QApplication::translate("MainWindow", "current value of the measure", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        clampMADistBox->setToolTip(QApplication::translate("MainWindow", "rescale the selected measure to the right range for visualization", nullptr));
#endif // QT_NO_TOOLTIP
        clampMADistBox->setText(QString());
#ifndef QT_NO_TOOLTIP
        minVisDistMASpin->setToolTip(QApplication::translate("MainWindow", "min value for rescaling", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        maxVisDistMASpin->setToolTip(QApplication::translate("MainWindow", "max value for rescaling", nullptr));
#endif // QT_NO_TOOLTIP
        label_14->setText(QApplication::translate("MainWindow", "transparency", nullptr));
#ifndef QT_NO_TOOLTIP
        MATransparentSlider->setToolTip(QApplication::translate("MainWindow", "MA min alpha", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        MATransExpSlider->setToolTip(QApplication::translate("MainWindow", "MA alpha exponent", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        hsViewGroup->setToolTip(QApplication::translate("MainWindow", "view options for skeleton", nullptr));
#endif // QT_NO_TOOLTIP
        hsViewGroup->setTitle(QApplication::translate("MainWindow", "skeleton", nullptr));
        hideHS->setText(QApplication::translate("MainWindow", "hide HS", nullptr));
        groupBox_3->setTitle(QString());
        label_22->setText(QApplication::translate("MainWindow", "viewing", nullptr));
#ifndef QT_NO_TOOLTIP
        visSkelDistCombo->setToolTip(QApplication::translate("MainWindow", "choose a measure on medial curve to visualize", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        clampMCDistBox_2->setToolTip(QApplication::translate("MainWindow", "map the the selected measure to the right range", nullptr));
#endif // QT_NO_TOOLTIP
        clampMCDistBox_2->setText(QString());
#ifndef QT_NO_TOOLTIP
        minVisDistSkelSpin->setToolTip(QApplication::translate("MainWindow", "min of the clamp range", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        maxVisDistSkelSpin->setToolTip(QApplication::translate("MainWindow", "max of the clamp range", nullptr));
#endif // QT_NO_TOOLTIP
        toolTabs->setTabText(toolTabs->indexOf(origSurfTab), QApplication::translate("MainWindow", "Visualization", nullptr));
        precomputeGroup->setTitle(QApplication::translate("MainWindow", "MA and MC", nullptr));
        label_15->setText(QApplication::translate("MainWindow", "sampling distance", nullptr));
#ifndef QT_NO_TOOLTIP
        nFixedSteinerSpin->setToolTip(QApplication::translate("MainWindow", "<html><head/><body><p>parameter \317\211 (distance between two steiner points)</p></body></html>", nullptr));
#endif // QT_NO_TOOLTIP
        precomputeAllBtn->setText(QApplication::translate("MainWindow", "precompute", nullptr));
        createSkelGroup->setTitle(QApplication::translate("MainWindow", "Skeleton", nullptr));
        label_17->setText(QApplication::translate("MainWindow", "ET on MA", nullptr));
        label_16->setText(QApplication::translate("MainWindow", "ET on MC", nullptr));
#ifndef QT_NO_TOOLTIP
        hsBt2Bt3Slider->setToolTip(QApplication::translate("MainWindow", "theta_2", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        hsBt1Bt2Slider->setToolTip(QApplication::translate("MainWindow", "theta_1", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        hsFaceDiffSpin->setToolTip(QApplication::translate("MainWindow", "theta_2", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        hsCurveDiffSpin->setToolTip(QApplication::translate("MainWindow", "theta_1", nullptr));
#endif // QT_NO_TOOLTIP
        smoothSkelCurve->setText(QApplication::translate("MainWindow", "curve smoothing", nullptr));
#ifndef QT_NO_TOOLTIP
        removeSmallCmpnts->setToolTip(QApplication::translate("MainWindow", "tick this if want to remove small components", nullptr));
#endif // QT_NO_TOOLTIP
        removeSmallCmpnts->setText(QApplication::translate("MainWindow", "clean debris", nullptr));
#ifndef QT_NO_TOOLTIP
        hsFaceDegenThreshold->setToolTip(QApplication::translate("MainWindow", "specify the area threshold. Components with smaller size will be removed", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        createSkelBtn->setToolTip(QApplication::translate("MainWindow", "create and visualize skeleton with the specified parameters", nullptr));
#endif // QT_NO_TOOLTIP
        createSkelBtn->setText(QApplication::translate("MainWindow", "create", nullptr));
#ifndef QT_NO_TOOLTIP
        exportHSBtn->setToolTip(QApplication::translate("MainWindow", "click to export the current skeleton to a .sk file", nullptr));
#endif // QT_NO_TOOLTIP
        exportHSBtn->setText(QApplication::translate("MainWindow", "export", nullptr));
        toolTabs->setTabText(toolTabs->indexOf(skelTab), QApplication::translate("MainWindow", "Skeletonization", nullptr));
#ifndef QT_NO_TOOLTIP
        MATab->setToolTip(QApplication::translate("MainWindow", "creating and viewing erosion thickness on the medial axis", nullptr));
#endif // QT_NO_TOOLTIP
        maBurnGroup->setTitle(QApplication::translate("MainWindow", "burn", nullptr));
#ifndef QT_NO_TOOLTIP
        burnBtn->setToolTip(QApplication::translate("MainWindow", "compute burn time and ET", nullptr));
#endif // QT_NO_TOOLTIP
        burnBtn->setText(QApplication::translate("MainWindow", "burn", nullptr));
#ifndef QT_NO_TOOLTIP
        cleanTopoBtn->setToolTip(QApplication::translate("MainWindow", "<html><head/><body><p>click if you want to remove all &quot;pockets&quot; (closed subcomplex) from the medial axis. </p><p>A cleaned medial axis will be written to a file.</p></body></html>", nullptr));
#endif // QT_NO_TOOLTIP
        cleanTopoBtn->setText(QApplication::translate("MainWindow", "clean topo", nullptr));
#ifndef QT_NO_TOOLTIP
        maMeasureGroup->setToolTip(QApplication::translate("MainWindow", "<html><head/><body>\n"
"<p>This is where you can visualize measure on the medial axis, <br>\n"
"or use measure to prune the medial axis</p>\n"
"</body></html>", nullptr));
#endif // QT_NO_TOOLTIP
        maMeasureGroup->setTitle(QApplication::translate("MainWindow", "thresholding", nullptr));
#ifndef QT_NO_TOOLTIP
        pruneMADistCombo1->setToolTip(QApplication::translate("MainWindow", "choose a dist metric for medial axis thresholding", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        enableFinePruneMA->setToolTip(QApplication::translate("MainWindow", "visualize the finner medial axis whose boundary is refined by the iso-contour of the measure", nullptr));
#endif // QT_NO_TOOLTIP
        enableFinePruneMA->setText(QApplication::translate("MainWindow", "fine medial axis", nullptr));
#ifndef QT_NO_TOOLTIP
        exportBTGroup->setToolTip(QApplication::translate("MainWindow", "export ET here", nullptr));
#endif // QT_NO_TOOLTIP
        exportBTGroup->setTitle(QApplication::translate("MainWindow", "export ET", nullptr));
#ifndef QT_NO_TOOLTIP
        exportBTBtn->setToolTip(QString());
#endif // QT_NO_TOOLTIP
        exportBTBtn->setText(QApplication::translate("MainWindow", "export", nullptr));
#ifndef QT_NO_TOOLTIP
        exportPerSectorBTBox->setToolTip(QApplication::translate("MainWindow", "<html><head/>\n"
"<body><p>Instead of writing just the ET value for each vertex into a .et file, <br>\n"
"export the ET value for each sector of each vertex into a .etps file</p>\n"
"</body></html>", nullptr));
#endif // QT_NO_TOOLTIP
        exportPerSectorBTBox->setText(QApplication::translate("MainWindow", "per-sector", nullptr));
        toolTabs->setTabText(toolTabs->indexOf(MATab), QApplication::translate("MainWindow", "ET", nullptr));
#ifndef QT_NO_TOOLTIP
        HSTab->setToolTip(QApplication::translate("MainWindow", "skeleton (generate, prune, etc.)", nullptr));
#endif // QT_NO_TOOLTIP
        hsCreateGroup->setTitle(QApplication::translate("MainWindow", "precompute", nullptr));
#ifndef QT_NO_TOOLTIP
        createHSBtn->setToolTip(QApplication::translate("MainWindow", "<html><head/><body>precomputation: <br>- computing medial curve, <br>- dualizing subdivisions induced by medial curve, <br>- assemblying skeleton</body></html>", nullptr));
#endif // QT_NO_TOOLTIP
        createHSBtn->setText(QApplication::translate("MainWindow", "precompute", nullptr));
#ifndef QT_NO_TOOLTIP
        mcPruneGroup->setToolTip(QApplication::translate("MainWindow", "explore medial curve pruning parameter here", nullptr));
#endif // QT_NO_TOOLTIP
        mcPruneGroup->setTitle(QApplication::translate("MainWindow", "thresholding medial curve", nullptr));
        exportHSGroup->setTitle(QApplication::translate("MainWindow", "export skeleton", nullptr));
#ifndef QT_NO_TOOLTIP
        hsPruneGroup->setToolTip(QApplication::translate("MainWindow", "explore pruning params (theta2 and theta1) for skeleton generation", nullptr));
#endif // QT_NO_TOOLTIP
        hsPruneGroup->setTitle(QApplication::translate("MainWindow", "prune skeleton", nullptr));
#ifndef QT_NO_TOOLTIP
        visHSBtn->setToolTip(QApplication::translate("MainWindow", "update and visualize skeleton with the specified parameters", nullptr));
#endif // QT_NO_TOOLTIP
        visHSBtn->setText(QApplication::translate("MainWindow", "create", nullptr));
        label_5->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-family:'Symbol'; font-size:12pt;\">q</span><span style=\" font-size:12pt; vertical-align:sub;\">2</span></p></body></html>", nullptr));
        label_7->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-family:'Symbol'; font-size:12pt;\">q</span><span style=\" font-size:12pt; vertical-align:sub;\">1</span></p></body></html>", nullptr));
        toolTabs->setTabText(toolTabs->indexOf(HSTab), QApplication::translate("MainWindow", "Skeleton", nullptr));
#ifndef QT_NO_TOOLTIP
        MCTab->setToolTip(QApplication::translate("MainWindow", "medial curve (generate, burn, prune, etc.)", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        mcDualizeGroup->setToolTip(QApplication::translate("MainWindow", "click the button to create medial curve and compute the 1d burn time on it", nullptr));
#endif // QT_NO_TOOLTIP
        mcDualizeGroup->setTitle(QApplication::translate("MainWindow", "dualize", nullptr));
#ifndef QT_NO_TOOLTIP
        dualizeBtn->setToolTip(QString());
#endif // QT_NO_TOOLTIP
        dualizeBtn->setText(QApplication::translate("MainWindow", "create", nullptr));
#ifndef QT_NO_TOOLTIP
        mpGroup->setToolTip(QApplication::translate("MainWindow", "medial point (the point last burned away during burning the medial curve)", nullptr));
#endif // QT_NO_TOOLTIP
        mpGroup->setTitle(QApplication::translate("MainWindow", "MP", nullptr));
        showMPBox->setText(QApplication::translate("MainWindow", "show MP", nullptr));
        toolTabs->setTabText(toolTabs->indexOf(MCTab), QApplication::translate("MainWindow", "MC/MP", nullptr));
#ifndef QT_NO_TOOLTIP
        ExportTab->setToolTip(QApplication::translate("MainWindow", "export (burn time, skeleton)", nullptr));
#endif // QT_NO_TOOLTIP
        exportGroup->setTitle(QString());
        ExportSkelBox->setText(QApplication::translate("MainWindow", "Export Skeleton", nullptr));
        exportBtn->setText(QApplication::translate("MainWindow", "Export", nullptr));
        toolTabs->setTabText(toolTabs->indexOf(ExportTab), QApplication::translate("MainWindow", "Export", nullptr));
#ifndef QT_NO_TOOLTIP
        SMetricTab->setToolTip(QApplication::translate("MainWindow", "surface function", nullptr));
#endif // QT_NO_TOOLTIP
        surfFuncGroup->setTitle(QApplication::translate("MainWindow", "vis", nullptr));
        surfFuncProjectBtn->setText(QApplication::translate("MainWindow", "project func", nullptr));
#ifndef QT_NO_TOOLTIP
        surfFuncCorrespSchemeCombo->setToolTip(QApplication::translate("MainWindow", "choose which scheme to use to compute correspondence between MC and orig. surf.", nullptr));
#endif // QT_NO_TOOLTIP
        diffuseSurfFunc->setText(QApplication::translate("MainWindow", "fill \"holes\"", nullptr));
        surfFuncSetupCorrespBtn->setText(QApplication::translate("MainWindow", "setup corresp.", nullptr));
        toolTabs->setTabText(toolTabs->indexOf(SMetricTab), QApplication::translate("MainWindow", "S. Metric", nullptr));
#ifndef QT_NO_TOOLTIP
        VideoTab->setToolTip(QApplication::translate("MainWindow", "animation (for burning, iso-surf, iso-cont, etc.)", nullptr));
#endif // QT_NO_TOOLTIP
        isoSurfGroup->setTitle(QApplication::translate("MainWindow", "iso surface", nullptr));
        isoSurfPrecomputeBtn->setText(QApplication::translate("MainWindow", "pre-compute", nullptr));
        hideIsoSurf->setText(QApplication::translate("MainWindow", "hide", nullptr));
        recursiveRefineBox->setText(QApplication::translate("MainWindow", "recursive refine", nullptr));
        hideSnappedFaceBox->setText(QApplication::translate("MainWindow", "hide snapped faces", nullptr));
        isoSurfRefineBtn->setText(QApplication::translate("MainWindow", "refine", nullptr));
        groupBox_7->setTitle(QApplication::translate("MainWindow", "iso contour", nullptr));
        isoContPrecomputeBtn->setText(QApplication::translate("MainWindow", "pre-compute", nullptr));
        hideIsoCont->setText(QApplication::translate("MainWindow", "hide contour", nullptr));
#ifndef QT_NO_TOOLTIP
        isoContShowMC->setToolTip(QApplication::translate("MainWindow", "show MC exposed by iso-contour", nullptr));
#endif // QT_NO_TOOLTIP
        isoContShowMC->setText(QApplication::translate("MainWindow", "show MC", nullptr));
        hidePastSurfBox->setText(QApplication::translate("MainWindow", "hide past surface", nullptr));
        groupBox_9->setTitle(QApplication::translate("MainWindow", "transparency", nullptr));
        groupBox_8->setTitle(QApplication::translate("MainWindow", "play all", nullptr));
#ifndef QT_NO_TOOLTIP
        evolveAllSlider->setToolTip(QApplication::translate("MainWindow", "drag this bar to evolve all iso-objects", nullptr));
#endif // QT_NO_TOOLTIP
        evolveAllPrecomputeBtn->setText(QApplication::translate("MainWindow", "pre-compute", nullptr));
#ifndef QT_NO_TOOLTIP
        evolveAllShowEntireMC->setToolTip(QApplication::translate("MainWindow", "Only exposed MC is shown if unchecked.", nullptr));
#endif // QT_NO_TOOLTIP
        evolveAllShowEntireMC->setText(QApplication::translate("MainWindow", "show entire MC", nullptr));
        toolTabs->setTabText(toolTabs->indexOf(VideoTab), QApplication::translate("MainWindow", "Video", nullptr));
#ifndef QT_NO_TOOLTIP
        MiscTab->setToolTip(QApplication::translate("MainWindow", "debug related stuff", nullptr));
#endif // QT_NO_TOOLTIP
        preprocessGroup->setTitle(QApplication::translate("MainWindow", "preprocess", nullptr));
#ifndef QT_NO_TOOLTIP
        label_2->setToolTip(QApplication::translate("MainWindow", "closeness for 2 vts to be for them to be considered \"same\"", nullptr));
#endif // QT_NO_TOOLTIP
        label_2->setText(QApplication::translate("MainWindow", "epsilon", nullptr));
#ifndef QT_NO_TOOLTIP
        label->setToolTip(QApplication::translate("MainWindow", "perturbation applied to \"same\" points", nullptr));
#endif // QT_NO_TOOLTIP
        label->setText(QApplication::translate("MainWindow", "pert", nullptr));
        miscBurntimeGroup->setTitle(QApplication::translate("MainWindow", "burntime", nullptr));
        visSphereFromFileBtn->setText(QApplication::translate("MainWindow", "show from file", nullptr));
        randBTBtn->setText(QApplication::translate("MainWindow", "randomize", nullptr));
        printBTBtn->setText(QApplication::translate("MainWindow", "print random", nullptr));
        showSphereBox->setText(QApplication::translate("MainWindow", "draw spheres", nullptr));
        printSelectVertInfoBtn->setText(QApplication::translate("MainWindow", "print selected", nullptr));
        renderParamGroup->setTitle(QApplication::translate("MainWindow", "general rendering params", nullptr));
        label_3->setText(QApplication::translate("MainWindow", "lines offset", nullptr));
        qmatGroup->setTitle(QApplication::translate("MainWindow", "qmat", nullptr));
        label_9->setText(QApplication::translate("MainWindow", "to qmat input", nullptr));
        outputWenpingBtn->setText(QApplication::translate("MainWindow", "convert", nullptr));
        readQMatMA->setText(QApplication::translate("MainWindow", "read qmat ma", nullptr));
        hideQMatBox->setText(QApplication::translate("MainWindow", "hide", nullptr));
        toolTabs->setTabText(toolTabs->indexOf(MiscTab), QApplication::translate("MainWindow", "Misc", nullptr));
#ifndef QT_NO_TOOLTIP
        pointSizeSpin->setToolTip(QApplication::translate("MainWindow", "change size of points", nullptr));
#endif // QT_NO_TOOLTIP
        doMAFaceScalarDiffusion->setText(QApplication::translate("MainWindow", "diffuse face field", nullptr));
#ifndef QT_NO_TOOLTIP
        computeAllDistBtn->setToolTip(QApplication::translate("MainWindow", "compute/update all distance metrics", nullptr));
#endif // QT_NO_TOOLTIP
        computeAllDistBtn->setText(QApplication::translate("MainWindow", "compute all", nullptr));
        usePerSheetBox->setText(QApplication::translate("MainWindow", "per sheet", nullptr));
#ifndef QT_NO_TOOLTIP
        maPruneRatio->setToolTip(QApplication::translate("MainWindow", "ratio: cur prune value / bbox size", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        minPruneDistMASpin1->setToolTip(QApplication::translate("MainWindow", "show/set minimal allowable dist value for pruning", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        maxPruneDistMASpin1->setToolTip(QApplication::translate("MainWindow", "show/set maximal allowable dist value for pruning", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        edgeDualOptCombo->setToolTip(QApplication::translate("MainWindow", "pick a method for dualizing edges", nullptr));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_TOOLTIP
        polyDualOptCombo->setToolTip(QApplication::translate("MainWindow", "pick a method for dualizing poly regions", nullptr));
#endif // QT_NO_TOOLTIP
        underEstimateBox->setText(QApplication::translate("MainWindow", "under estimate", nullptr));
#ifndef QT_NO_TOOLTIP
        onlyUnburntBox->setToolTip(QApplication::translate("MainWindow", "only show unburnt part of the dual structure", nullptr));
#endif // QT_NO_TOOLTIP
        onlyUnburntBox->setText(QApplication::translate("MainWindow", "only unburnt", nullptr));
#ifndef QT_NO_TOOLTIP
        stopAtJuncBox->setToolTip(QApplication::translate("MainWindow", "stop burning the dual line structure at junction points", nullptr));
#endif // QT_NO_TOOLTIP
        stopAtJuncBox->setText(QApplication::translate("MainWindow", "stop at junction", nullptr));
        protectBT2Box->setText(QApplication::translate("MainWindow", "protect BT2", nullptr));
        label_8->setText(QApplication::translate("MainWindow", "line rel diff", nullptr));
        label_6->setText(QApplication::translate("MainWindow", "face rel diff", nullptr));
#ifndef QT_NO_TOOLTIP
        mcBurnGroup->setToolTip(QApplication::translate("MainWindow", "options for burning the dual structure", nullptr));
#endif // QT_NO_TOOLTIP
        mcBurnGroup->setTitle(QApplication::translate("MainWindow", "burn", nullptr));
        burnMedialCurveBtn->setText(QApplication::translate("MainWindow", "burn", nullptr));
        printMCStatsBtn->setText(QApplication::translate("MainWindow", "print stats", nullptr));
#ifndef QT_NO_TOOLTIP
        mcPruneRatio->setToolTip(QApplication::translate("MainWindow", "distance value restricted to [0, max]", nullptr));
#endif // QT_NO_TOOLTIP
        colorPerVert->setText(QApplication::translate("MainWindow", "color-per-vert", nullptr));
        colorPerFace->setText(QApplication::translate("MainWindow", "color-per-face", nullptr));
#ifndef QT_NO_TOOLTIP
        hsUseTypedInput->setToolTip(QApplication::translate("MainWindow", "use theta_2 and theta_1 in the right fields as params", nullptr));
#endif // QT_NO_TOOLTIP
        hsUseTypedInput->setText(QApplication::translate("MainWindow", "use typed input", nullptr));
        visBallStick->setText(QApplication::translate("MainWindow", "ball-stick", nullptr));
        preserveMCTopo->setText(QApplication::translate("MainWindow", "preserve topo", nullptr));
        toolTabs->setTabText(toolTabs->indexOf(hiddenTab), QApplication::translate("MainWindow", "hidden", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // COMPACTUI_H
