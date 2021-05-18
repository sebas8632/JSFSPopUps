//
//  PopUpMessage.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 16/05/21.
//

import Foundation
import  UIKit

public class PopUpMessageView: UIView {

    private var popUpMessage: PopUpMessageModel?
    
    required init(popUpMessage: PopUpMessageModel) {
        super.init(frame: CGRect.zero)
        self.popUpMessage = popUpMessage
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(mainView)
        mainView.addSubview(contentView)
        mainView.addSubview(imageView)
        contentView.addSubview(title)
        contentView.addSubview(message)
        contentView.addSubview(dismissButton)
    }
    
    private func setupConstraints() {
        let margins: UILayoutGuide = safeAreaLayoutGuide
        superViewConstraint(margins: margins)
        contentViewConstraint()
        imageConstraint()
        titleConstraint()
        messageConstraint()
        buttonConstraint()
    }
    
    private func superViewConstraint(margins: UILayoutGuide) {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    private func contentViewConstraint() {
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            contentView.heightAnchor.constraint(equalToConstant: 300),
            contentView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func imageConstraint() {
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            imageView.widthAnchor.constraint(equalToConstant: 70)

        ])
    }
    
    private func titleConstraint() {
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16)
        ])
    }
    private func messageConstraint() {
        NSLayoutConstraint.activate([
            message.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            message.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            message.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)

        ])
    }
    
    private func buttonConstraint() {
        NSLayoutConstraint.activate([
            dismissButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            dismissButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            dismissButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            dismissButton.heightAnchor.constraint(equalToConstant: 60)

        ])
    }
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)

        return view
        
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        return view
        
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Black", size: 32)
        label.numberOfLines = 3
        label.text = popUpMessage?.title
        label.textAlignment = .center
        return label
    }()
    
    lazy var message: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir", size: 20)
        label.numberOfLines = 0
        label.text = popUpMessage?.description
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = popUpMessage?.errorType.getImage()
        return imageView
    }()
    
    lazy var dismissButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ok", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.backgroundColor = popUpMessage?.errorType.getColor()
        return button
    }()
}
